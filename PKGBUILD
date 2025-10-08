# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=gativideo
pkgver=0.1.1
pkgrel=1
pkgdesc="Minimal TUI app to download YTS movies and opensubtitles subtitles."
arch=('x86_64' 'aarch64')
url="https://github.com/javiorfo/gativideo"
license=('MIT')
depends=('transmission-cli')

if [[ "$CARCH" == "aarch64" ]]; then
  source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/gativideo-$pkgver-aarch64.tar.gz")
  sha512sums=('ce71cadeab22f81855e2f54f7cb86ace525f0e9b1f5e9e6741914a0abfc7b7ef11734a299f91d7891e4723b67544d0a0f36f4b3d7521706341936cb773a97621')
else
  source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/gativideo-$pkgver-x86_64.tar.gz")
  sha512sums=('ca03479a1f765c8bedf81713fb9b7e072f4180d84ce8a53499592952acb1bf205e65dc480c1315249889b9280372e9b8cd159e84efdf082ad34b676ff5a23942')
fi

conflicts=("${pkgname}")
provides=("${pkgname}")

package() {
  cd "${pkgname}-$pkgver"
  install -Dm 755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
