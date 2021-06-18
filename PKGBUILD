# Maintainer: Arisa Snowbell (goddess@chizuru.space)
pkgname=firefox-session-manager
pkgver=0.1.1
pkgrel=2
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Manager for your Firefox sessions"
license=('GPL3')
url='https://gitlab.com/Arisa_Snowbell/firefox-session-manager'
source=("https://gitlab.com/Arisa_Snowbell/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('cc28256f75d34c024529f375efa12572987e8ed1590674f5af0eecacfaac95d5')

build() {
    cd "$srcdir/$pkgname-v$pkgver"

    cargo build --release --target-dir target
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"

    install -Dm755 target/release/${pkgname} "${pkgdir}/usr/bin/fsm"
}
