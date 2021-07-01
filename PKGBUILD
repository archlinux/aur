# Maintainer: Matthias Fulz <mfulz at olznet dot de>
pkgname=archbuilder
pkgver=0.9.3
pkgrel=1
pkgdesc='makepkg wrapper that uses buildah'
url='https://github.com/mfulz/archbuilder'
arch=('any')
source=(
        "https://github.com/mfulz/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
       )
sha256sums=('3c97db12e42b7442ac08deef265f3fd446b7934a99e9361df61b5b825946c1aa')
depends=('buildah')

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
}
