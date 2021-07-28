# Maintainer: Joseph R. Quinn <quinn period josephr at protonmail dot com>

pkgname="trunk-bin"
pkgver="0.12.1"
pkgrel=1
pkgdesc="A WASM web application bundler for Rust."
arch=('x86_64')
url="https://github.com/thedodd/trunk"
license=('MIT/Apache-2.0')
provides=("trunk")
source=(
    "${pkgname%-bin}-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-x86_64-unknown-linux-gnu.tar.gz"
    "https://raw.githubusercontent.com/thedodd/${pkgname%-bin}/v$pkgver/LICENSE-APACHE"
    "https://raw.githubusercontent.com/thedodd/${pkgname%-bin}/v$pkgver/LICENSE-MIT"
)
b2sums=('12f7725d5f86007e9141defd3670f572e848e5ef10a742d42472d9b0089e0bf52e93055149b88389c56631a296e68dc979747755a17674a35f3535d4176abd75'
        '21fadd835dd2d39db33e007a95f4ce46277c5c87902a6e8a530673ceab9b4d13246fb80f93906e9cc684db6e35f6ead13cf71c553468f3a07df6e1c7d9b85b4b'
        'fb26aba82fe953b9895595c5b7c11b5363b83bd60cf1cb6aab572df6dadb940711eda080f8ad77fb519e79309211318b6200081bb05be7b71117a07082c3815d')

prepare() {
    bsdtar -xf "${pkgname%-bin}-$pkgver.tar.gz"
}

package() {
    install -Dm755 "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
