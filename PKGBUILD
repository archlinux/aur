# Maintainer: Arisa Snowbell (goddess@chizuru.space)
pkgname=firefox-session-manager
pkgver=0.1.2
pkgrel=1
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Manager for your Firefox sessions"
license=('GPL3')
url='https://gitlab.com/Arisa_Snowbell/firefox-session-manager'
source=("https://gitlab.com/Arisa_Snowbell/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('4cfe28e9cab50d24095222a14e8c67164dc8b7176ddd61936ebc83016f2b7d8c')

build() {
    cd "$srcdir/$pkgname-v$pkgver"

    cargo build --release --target-dir target
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"

    install -Dm755 target/release/${pkgname} "${pkgdir}/usr/bin/fsm"
}
