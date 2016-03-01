# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgbase=python-git-up
pkgname=('python-git-up' 'python2-git-up')
pkgver=1.4.0
pkgrel=1
pkgdesc="A python implementation of git up"
arch=('any')
url="http://github.com/msiemens/PyGitUp"
license=('MIT')
makedepends=('python-setuptools' 'python-termcolor' 'python-colorama' 'python-docopt' 'python-git'
             'python2-setuptools' 'python2-termcolor' 'python2-colorama' 'python2-docopt' 'python2-git')
source=($pkgname-$pkgver.tar.gz::https://github.com/msiemens/PyGitUp/archive/v$pkgver.tar.gz)
sha256sums=('d5848f89fcf7caaefe72f3d27c1e7bf557d19c89d87448688b83435a03b3f2a2')

package_python-git-up() {
  depends=('python-termcolor' 'python-colorama' 'python-docopt' 'python-git')

  cd "${srcdir}"/PyGitUp-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1

#license
  install -Dm644 LICENCE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-git-up() {
  depends=('python2-termcolor' 'python2-colorama' 'python2-docopt' 'python2-git')

  cd "${srcdir}"/PyGitUp-$pkgver
  python2 setup.py install --root="${pkgdir}" --optimize=1

#license
  install -Dm644 LICENCE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
