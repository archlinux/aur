# Maintainer: Joseph R. Quinn <quinn period josephr at protonmail dot com>

pkgname="trunk-bin"
pkgver="0.17.1"
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
b2sums=('2eee954698409a979777db73a4d2efc795b10b1bb28383d8b2e727a0d955b7e8a8f13f3834e08c747b3c690ec0dc10c959efcffa88e0ffc346b8d7d74c966079'
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
