# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgbase=python-git-up
pkgname=('python-git-up' 'python2-git-up')
pkgver=1.4.5
pkgrel=1
pkgdesc="A python implementation of git up"
arch=('any')
url="http://github.com/msiemens/PyGitUp"
license=('MIT')
makedepends=('python-setuptools' 'python-termcolor' 'python-colorama' 'python-docopt' 'python-git'
             'python2-setuptools' 'python2-termcolor' 'python2-colorama' 'python2-docopt' 'python2-git')
source=($pkgname-$pkgver.tar.gz::https://github.com/msiemens/PyGitUp/archive/v$pkgver.tar.gz)
sha256sums=('ea64e8e5270171b31294d98d374b44fb3035108b8d5f72743a87f50f77bdfcdf')

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
