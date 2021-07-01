# Maintainer: Matthias Fulz <mfulz at olznet dot de>
pkgname=archbuilder
pkgver=0.9.4
pkgrel=1
pkgdesc='makepkg wrapper that uses buildah'
url='https://github.com/mfulz/archbuilder'
arch=('any')
source=(
        "https://github.com/mfulz/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
       )
sha256sums=('d6a36a91af0eadd048177ceec6b643a8ba6a10d793e4652fc833445a121993e1')
depends=('buildah')

backup=(
        'etc/archbuilder/archbuilder.env'        
       )

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
