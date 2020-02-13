# Maintainer: Lev Lybin <lev.lybin at gmail dot com>
# Maintainer: Maksym Sheremet <msheremet at sheremets dot com>

pkgname=upwork
pkgver=5.3.3.862
_rawver=${pkgver//./_}
_hashver='0gofuuatmjqd0n86'
pkgrel=1
pkgdesc='Desktop App 64-bit Standard version'
arch=(x86_64)
url='https://www.upwork.com/downloads?source=Footer'
license=(custom)
conflicts=(upwork-alpha)
depends=(alsa-lib gtk3 libxss nss)
install=upwork.install
source=(https://updates-desktopapp.upwork.com/binaries/v${_rawver}_${_hashver}/upwork_${pkgver}_amd64.deb
        LICENSE)
sha256sums=('249c3e168db5cf8bb46e2282357c4cdd8a8b80b9c0d599b8b787863b03f9f45e'
            '793d8d7bc0f088c48798bda3d5483972636c6b8c5dcd9aeaf85411f7d4547b38')

prepare() {
    cd $srcdir
    tar -xJf $srcdir/data.tar.xz
}

package() {
    cd $srcdir
    cp -rp usr $pkgdir/usr

    install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
