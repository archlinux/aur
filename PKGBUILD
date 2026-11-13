# Maintainer: wins1ey <wins1ey at wins1ey dot win>
pkgname=libresplit-bin
_pkgname=libresplit
pkgver=0.3.2
pkgrel=1
pkgdesc="Free speedrun timer with auto splitting and load removal"
arch=('x86_64')
url='https://libresplit.org'
license=('GPL-3.0-or-later')
depends=(
    'gtk4'
    'jansson'
    'lua54'
)
optdepends=(
    'glib-networking: web split icons'
    'gvfs: web split icons'
)
provides=("$_pkgname")
conflicts=("$_pkgname")

options=('!debug' '!strip')
source=("$_pkgname-$pkgver.zip::https://github.com/LibreSplit/LibreSplit/releases/download/v$pkgver/LibreSplit-$pkgver-standalone-x86_64.zip")
sha256sums=('2a315fc652df00f4520b1e5a4b2df50bceee730e35eb14ccd9cc4c40080e807e')

package() {
    cp -a usr "$pkgdir/"
    mv "$pkgdir/usr/share/licenses/$_pkgname" "$pkgdir/usr/share/licenses/$pkgname"
}
