# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgbase=python-git-up
pkgname=('python-git-up' 'python2-git-up')
pkgver=1.6.0
pkgrel=1
pkgdesc="A python implementation of git up"
arch=('any')
url="http://github.com/msiemens/PyGitUp"
license=('MIT')
makedepends=('python-setuptools' 'python-termcolor' 'python-colorama' 'python-docopt' 'python-gitpython'
             'python2-setuptools' 'python2-termcolor' 'python2-colorama' 'python2-docopt' 'python2-gitpython')
source=($pkgname-$pkgver.tar.gz::https://github.com/msiemens/PyGitUp/archive/v$pkgver.tar.gz)
sha256sums=('e826b2dadff42048868da259f367455fb6ef27fdaa110b39b6447bf0210c1464')

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
