# Maintainer: Matthias Fulz <mfulz at olznet dot de>
pkgname=archbuilder
pkgver=0.9.2
pkgrel=1
pkgdesc='makepkg wrapper that uses buildah'
url='https://gitea.olznet.de/mfulz/archbuilder'
arch=('any')
source=(
        "https://gitea.olznet.de/mfulz/$pkgname/archive/v$pkgver.tar.gz"
       )
sha256sums=('b9994a902fba433bca7b277bdf0a29af134622ee4424c66f0a2968779b27a97c')
depends=('buildah')

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" install
}
