# Maintainer: Matthew Murray <matt@compti.me>
pkgname=python-exif-git
_pkgname=exif
pkgver=r57.7a3aafd
pkgrel=1
pkgdesc="Read and modify image EXIF metadata using Python without any third-party software dependencies"
arch=('any')
license=('MIT')
depends=("python" "python-plum-py")
makedepends=("python" "python-setuptools")
conflicts=("python-${_pkgname}")
provides=("python-${_pkgname}")
url="https://github.com/TNThieding/${_pkgname}"
source=("git+${url}.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --prefix=/usr --root "${pkgdir}" || return 1
}

# vim:set ts=2 sw=2 et:
