# Maintainer: Lena Pastwa <aur@lnps.me>
pkgname=shstatus
pkgver=2.1.0
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
b2sums=('b6f24a165a51cad5e28d8dfe0146451eec22bb14e0113fad55c7e2fbe34939d9fcc87e76dfefd3b1708185706cc2038a012f26b36b58c66167a70d7a54105085')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
