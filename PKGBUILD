# Maintainer: acuteenvy
pkgname=shstatus
pkgver=2.0.1
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
b2sums=('8fe0286d5da35041b48f31c6b3cebd476a13883f873cc2c3faf4b9006d6b965c811b7513dcceef6bc6853bee5b83b3e3e5e46777d29e0419d4325b1c86f5efe4')

package() {
    cd "$pkgname-$pkgver"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
