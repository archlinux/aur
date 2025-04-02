# Maintainer: ussur, Redchin Daniil <redchindaniil@gmail.com>

pkgname=time-log
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool to timestamp plaintext real-time logs"
arch=('x86_64')
url="https://github.com/USSURATONCACHI/time-log"
license=('MIT')
depends=()
makedepends=('base-devel' 'pandoc')
source=("git+https://github.com/USSURATONCACHI/time-log.git#tag=v${pkgver}")
sha256sums=('76f8099ba91f8dbbeb6d78bbbe694ef360eb33ac7aaedd67a41ad98ac883d23d')

build() {
    cd "$srcdir/time-log"
    make
}

package() {
    cd "$srcdir/time-log"
    install -Dm755 build/bin/time-log "$pkgdir/usr/bin/time-log"
    install -Dm644 build/share/man/man1/time-log.1 "$pkgdir/usr/share/man/man1/time-log.1"
    install -Dm644 build/share/man/ru/man1/time-log.1 "$pkgdir/usr/share/man/ru/man1/time-log.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
