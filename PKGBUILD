# Maintainer: Berke Enercan <berkeenercan@tutanota.com>

pkgname=ytsub-bin
_pkgname=ytsub
pkgver=0.7.0
pkgrel=1
pkgdesc='A subscriptions only TUI Youtube client'
url='https://github.com/sarowish/ytsub'
arch=("x86_64")
license=('GPL-3.0-only')
depends=('gcc-libs' 'sqlite')
optdepends=('mpv: for playing videos', 'yt-dlp: for playing videos')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-gnu.tar.gz")
sha256sums=('64c14fec2574b09520cc3ce567becb3daa07f8d37701b8dcd17db13e1367d476')

package() {
    cd "$_pkgname-$pkgver"
    install -Dm 755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
