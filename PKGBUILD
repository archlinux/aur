# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>

pkgname=gnome-shell-extension-nasa-apod
pkgver=39
pkgrel=1
pkgdesc="Change your wallpaper daily to the NASA astronomy picture of the day"
arch=('any')
url="https://github.com/Elinvention/${pkgname}"
license=('GPL3')
depends=('gnome-shell')
makedepends=('glib2' 'intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz")
sha512sums=('af8303e1fead93c4500da5494aa350466282b0230f73ade4c3b4f1d8d990071a13b4e9f33ed906199ae78e6384dea4d28e0f5f274c43e3afbe46772a8a6a2094')

build() {
    cd "$pkgname-$pkgver"

    make build
}

package() {
    cd "$pkgname-$pkgver"

    make INSTALL_PATH="$pkgdir/usr/share/gnome-shell/extensions" install
}
