# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=gativideo
pkgver=0.1.0
pkgrel=1
pkgdesc="Minimal TUI app to download YTS movies and opensubtitles subtitles."
arch=('x86_64' 'aarch64')
url="https://github.com/javiorfo/gativideo"
license=('MIT')
depends=('transmission-cli')

if [[ "$CARCH" == "aarch64" ]]; then
  source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/gativideo-$pkgver-aarch64.tar.gz")
  sha512sums=('ae712d3a0790c76658976cbed90d02f5a92cd0e276ddf133923702f48890ee453928751b5afec2849946bbe2a8a0d1d9ce2bb73b50933a77d0dfa3913b751e2d')
else
  source=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/gativideo-$pkgver-x86_64.tar.gz")
  sha512sums=('d258fa7b7b29aadc6f540ab270d43c1a8b58a9cae0778091ccb7c387f6cd232f1905ee4c189d93db5948b4879e41516af1f5dd504444f140a9738cbada66da75')
fi

conflicts=("${pkgname}")
provides=("${pkgname}")

package() {
  cd "${pkgname}-$pkgver"
  install -Dm 755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
