# Maintainer: tembleking <tembleking at gmail dot com>
pkgname='pgoapi-git'
pkgver=r154.dffe149
pkgrel=1
pkgdesc="Pokemon Go API lib"
arch=("any")
url="https://github.com/tejado/pgoapi"
license=('MIT')
depends=("python2"
         "python2-requests"
         "python2-protobuf"
         "python2-gpsoauth"
         "python2-geopy"
         "python2-s2sphere")
makedepends=("git")
source=("git://github.com/tejado/pgoapi.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/pgoapi"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/pgoapi"
	python2 setup.py build
}

package() {
	cd "$srcdir/pgoapi"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
