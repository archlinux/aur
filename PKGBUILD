# Maintainer: acuteenvy
pkgname=shstatus
pkgver=2.0.0
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
b2sums=('b8596fd7190e92931efdb8ffc0803bc64eefa42b931e9129589543766da553ad13258ac1e079cae616f40404ebf2b80baa5002f361256a488c2f2b0b061dd8aa')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
