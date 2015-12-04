# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgbase=python-git-up
pkgname=('python-git-up' 'python2-git-up')
pkgver=1.3.1
pkgrel=1
pkgdesc="A python implementation of git up"
arch=('any')
url="http://github.com/msiemens/PyGitUp"
license=('MIT')
makedepends=('python-setuptools' 'python-termcolor' 'python-colorama' 'python-docopt' 'python-gitpython'
             'python2-setuptools' 'python2-termcolor' 'python2-colorama' 'python2-docopt' 'python2-gitpython')
source=(https://github.com/msiemens/PyGitUp/archive/v${pkgver}.tar.gz)
sha256sums=('91f351bb2b197b7b49a2de714191aed5aa5b26443b7c4dca2fea01b75808c6d3')

package_python-git-up() {
  depends=('python-termcolor' 'python-colorama' 'python-docopt' 'python-gitpython')

  cd "${srcdir}"/PyGitUp-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1

#license
  install -Dm644 LICENCE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-git-up() {
  depends=('python2-termcolor' 'python2-colorama' 'python2-docopt' 'python2-gitpython')

  cd "${srcdir}"/PyGitUp-$pkgver
  python2 setup.py install --root="${pkgdir}" --optimize=1

#license
  install -Dm644 LICENCE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
