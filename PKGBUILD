# Maintainer: acuteenvy
pkgname=shstatus
pkgver=2.0.2
pkgrel=1
pkgdesc="A simple statusline generator for i3bar and swaybar"
arch=('any')
url="https://github.com/acuteenvy/$pkgname"
backup=('etc/shstatus/config.sh')
license=('MIT')
depends=('bash')
optdepends=(
    'coreutils: show disk usage'
    'procps-ng: show memory and swap usage'
    'libpulse: show pulseaudio volume'
    'wireplumber: show pipewire volume'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
b2sums=('181b5c21194831e9c646d5fe8422bf4fe3a416cdc1215e0d16826809ff9b34ad2b6bc699bedb335231520a463bfbc357639051dd0aab3fec1c0a20731fa4f99e')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
