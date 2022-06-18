# Maintainer: MedzikUser <nivua1fn@duck.com>
pkgname='imgurs'
pkgver="0.8.1"
pkgrel=1
pkgdesc='CLI for a Imgur API written in Rust'
arch=('x86_64')
url="https://github.com/MedzikUser/imgurs"
license=('BSD3')
makedepends=('cargo')
optdepends=('libnotify: Notification support'
            'xsel: Clipboard support'
            'xclip: Clipboard support')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --locked
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm 755 target/release/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
