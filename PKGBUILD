# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>
pkgname=python-vitalus-git
pkgver=v0.3.8.r6.g73abf81
pkgrel=1
pkgdesc="Python rsync wrapper for backup"
arch=('any')
url="https://github.com/sciunto/Vitalus"
license=('GPL3')
depends=('python' 'rsync')
optdepends=()
makedepends=('git' 'python-setuptools')
provides=()
conflicts=()
source=("git://github.com/sciunto/Vitalus.git")
md5sums=('SKIP')

pkgver() {
      cd "$srcdir/Vitalus"
      git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}


build() {
  cd "$srcdir/Vitalus"
  python setup.py build
}

package() {
  cd "$srcdir/Vitalus"
  python setup.py install --root="${pkgdir}"
}


# vim:set ts=2 sw=2 et:
