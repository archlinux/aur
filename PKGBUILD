# Maintainer: William Gathoye <william at gathoye dot be>
# Contributor: Emil Vanherp <emil dot vanherp at hotmail dot com>
# Contributor: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Valère Monseur <valere dot monseur at ymail·com>

pkgname=eid-viewer
pkgver=4.1.20
pkgrel=1

pkgdesc="eID-Viewer is a graphical interface to the Belgian Electronic Identity Card"
arch=('i686' 'x86_64')
url="http://eid.belgium.be/"
license=('LGPL3')

depends=('java-runtime' 'gsettings-desktop-schemas' 'eid-mw')

install=${pkgname}.install

source=(
    "https://dist.eid.belgium.be/continuous/sources/$pkgname-$pkgver-v$pkgver.src.tar.gz"
    "https://dist.eid.belgium.be/continuous/sources/$pkgname-$pkgver-v$pkgver.src.tar.gz.asc"
)
sha512sums=(
    b3fb38ce7c98720c0c51cc4d3411c223ed41f31c81a9f71efa2dc943d87151dbf03ab2b3b3d7d3e9f61d9c296c18176dea5e976e33f6bf4f1338c533a7f05536
    d4bd694f0a934cc6b869b559abd6841417579bd591e3db0c1d951b2685d06d45e0a09c3882d57b0922519e3dff332c18e291defbceabdd1c986cde992576b15b
)

validpgpkeys=(
    D95426E309C0492990D8E8E2824A5E0010A04D46 # Belgian eID Automatic Signing Key (continuous builds)
)

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
}

package() {
    cd "$pkgname-$pkgver"
    make install DESTDIR="$pkgdir"
}
