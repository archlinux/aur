# Maintainer: Arisa Snowbell (goddess@chizuru.space)
pkgname=firefox-session-manager
pkgver=0.1.0
pkgrel=1
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Manager for your Firefox sessions"
license=('GPL3')
url='https://gitlab.com/Arisa_Snowbell/firefox-session-manager'
source=("https://gitlab.com/Arisa_Snowbell/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('bba688cc8949ee52515d43deb2d62fc73eadaedcb669260ace29e37b7d2f2bcf')

build() {
    cd "$srcdir/$pkgname-v$pkgver"

    cargo build --release --target-dir target
}

package() {
    cd "$srcdir/$pkgname-v$pkgver"

    install -Dm755 target/release/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
