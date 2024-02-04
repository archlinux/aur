# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-nasa-apod
pkgver=38
pkgrel=1
pkgdesc="Change your wallpaper daily to the NASA astronomy picture of the day"
arch=('any')
url="https://github.com/Elinvention/${pkgname}"
license=('GPL-3.0-only')
depends=('gnome-shell')
makedepends=('glib2' 'intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha512sums=('f15cf5c7d41a67bb05a9d9f29d7be1b07cf8c0b4eb410e32bcb248a7b0dc48a5b6f29b15aac3c253f9b1fd2c538076f6b8ceda8f535859deb84024862a50de43')

build() {
    cd "$pkgname-$pkgver"

    make build
}

package() {
    cd "$pkgname-$pkgver"

    mkdir tmp-extract
    unzip nasa_apod@elinvention.ovh.zip -d tmp-extract

    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/nasa_apod@elinvention.ovh"
    cp -r tmp-extract/* "$pkgdir/usr/share/gnome-shell/extensions/nasa_apod@elinvention.ovh"
}
