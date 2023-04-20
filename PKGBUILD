# Maintainer: acuteenvy
pkgname=shstatus
pkgver=1.1.0
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
b2sums=('bfc1c66713ef84731daf8ea71bf7dfb54c2cbfaa4615886c187c77239aedff8896a435993106eec060230634bf04ee0275231a0b7b5b7256ab7eba6d7f81c37a')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
