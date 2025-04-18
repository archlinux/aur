# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=bitsmuggler
pkgbin=bitsmuggler
pkgver=v0.1.2
pkgrel=1
pkgdesc="TUI app to download YTS movies and opensubtitles subs"
arch=('x86_64' 'aarch64')
url="https://github.com/javiorfo/bitsmuggler"
license=('MIT')
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/bitsmuggler-x86_64-$pkgver.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/bitsmuggler-aarch64-$pkgver.tar.gz")
sha512sums_x86_64=('84138886ecf0f6db5d3ca986b2637b4eae404608bf10d37d3372a57069a9fa9ed26af2d1b6ea863e52816b1a86a96885a00e593890bcbc7722c00bddded77587')
sha512sums_aarch64=('392c8d46991f71d249a1c4c2a2ec44d5700b93f823f3915d964b5a8d4561247a81d7f61b3880e34cabf3648778c1b1cd3560a288371aafeab3edf30b7047f8dc')
conflicts=("${pkgname}")
provides=("${pkgname}")

package() {
  local goarch

  case "$CARCH" in
  x86_64 | aarch64) goarch="$CARCH" ;;
  *) return 1 ;;
  esac

  cd "${pkgname}-$goarch-$pkgver"
  install -Dm 755 "${pkgbin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}

