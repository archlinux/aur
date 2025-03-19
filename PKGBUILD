# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=bitsmuggler
pkgbin=bitsmuggler
pkgver=v0.1.0
pkgrel=1
pkgdesc="TUI app to download YTS movies and opensubtitles subs"
arch=('x86_64' 'aarch64')
url="https://github.com/javiorfo/bitsmuggler"
license=('MIT')
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/bitsmuggler-x86_64-$pkgver.tar.gz")
source_aarch64=("$pkgname-$pkgver.tar.gz::$url/releases/download/$pkgver/bitsmuggler-aarch64-$pkgver.tar.gz")
sha512sums_x86_64=('c099bd6edefa2c06f4b07a6ca3ca962be76b698b3ad406c8676aed928df8dbc69233186684d27bb17f71cfd1fefaa09de66202541017662861ab99b685ef6869')
sha512sums_aarch64=('76399ad37520e632300cc5aa428728cb42b4e52575e2e5527dacbbf5633b9ca5cbe27fd4d6e931815f3ea3764a454df00ce75ad4ad514fbd724fca0b56871295')
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

