# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=bitsmuggler
pkgbin=bitsmuggler
pkgver=v0.1.1
pkgrel=1
pkgdesc="TUI app to download YTS movies and opensubtitles subs"
arch=('x86_64' 'aarch64')
url="https://github.com/javiorfo/bitsmuggler"
license=('MIT')
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/bitsmuggler-x86_64-$pkgver.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/bitsmuggler-aarch64-$pkgver.tar.gz")
sha512sums_x86_64=('50a9db513ae44e14a67755d82ebe00a61a5e6ae8b8ebef857e0eece57bf2ce0abe20dabd5e05b80f73cdbf2eafe2b9ccd686c19e82f81a620574f2722a32d58d')
sha512sums_aarch64=('4f807db96d3a88032ecae383ed9f88b000a49f9c42a4989d09bf16f81b3c684b559eb38ade9f44a5f9583e39b872258bceb0e17abff8788aaf46c427134dae4d')
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

