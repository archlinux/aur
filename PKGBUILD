# Maintainer: Berke Enercan <berkeenercan@tutanota.com>

pkgname=ytsub-bin
_pkgname=ytsub
pkgver=0.8.0
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
sha256sums=('6ce0481955f0c362319d60778eddc2958d99dc6483b33b85c8486e1308ceead8')

package() {
    cd "$_pkgname-$pkgver"
    install -Dm 755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
