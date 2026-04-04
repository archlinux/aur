# Maintainer: tuxxx <nzb_tuxxx@proton.me>

pkgname=nzb-monkey-go-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="NZBLNK-URI handler supporting SABnzbd, NZBGet & Synology DS (Go-based)"
arch=('x86_64')
url="https://github.com/Tensai75/nzb-monkey-go"
license=('MIT')
depends=('glibc')
optdepends=('xdg-utils: register nzblink handler')
provides=("nzb-monkey-go")
conflicts=("nzb-monkey-go-git" "nzb-monkey-go")

source=(
    "${url}/releases/download/v${pkgver}/nzb-monkey-go_v${pkgver}-linux-amd64.zip"
    "com.github.tensai75.nzb-monkey-go.desktop"
)
sha256sums=('0e4ea7cdf222d994632f6a6efdda2f3a1b7bc77838c9036b6f68fb0add1036a6'
            'dbf841f7241af6719283123df580f798f7bb27a8f26a28b3af1f64ed7e50a395')

package() {
    install -Dm755 "nzb-monkey-go" "$pkgdir/usr/bin/nzb-monkey-go"
    install -Dm644 "com.github.tensai75.nzb-monkey-go.desktop" \
        "$pkgdir/usr/share/applications/com.github.tensai75.nzb-monkey-go.desktop"
}
