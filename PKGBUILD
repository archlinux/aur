# Maintainer: Matthias Fulz <mfulz at olznet dot de>
pkgname=archbuilder
pkgver=0.9.5
pkgrel=1
pkgdesc='makepkg wrapper that uses buildah'
url='https://github.com/mfulz/archbuilder'
arch=('any')
source=(
        "https://github.com/mfulz/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
       )
sha256sums=('c55e963e34fb9d0d0b8b5a658428acd073f4fb53536f145d118c3729f7ab4e4b')
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
