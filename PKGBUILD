# Maintainer: tarball <bootctl@gmail.com>

pkgname=trufflehog-bin
pkgver=3.82.2
pkgrel=1
pkgdesc='Find, verify, and analyze leaked credentials'
url='https://github.com/trufflesecurity/trufflehog'
arch=(x86_64 aarch64)
license=(AGPL-3.0-only)
provides=(trufflehog)
conflicts=("${provides[@]}")

source=("https://raw.githubusercontent.com/trufflesecurity/trufflehog/v$pkgver/examples/generic.yml")
source_x86_64=("$url/releases/download/v$pkgver/trufflehog_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/trufflehog_${pkgver}_linux_arm64.tar.gz")

sha256sums=('37e56a67543eea634967c9516831c823967fb2e2cbfedc036be25648f5d696d2')
sha256sums_x86_64=('b4360a24078d17be78353d3eaf78329f67f10d15a3eef4c5cbf775bd79e0b0a4')
sha256sums_aarch64=('55c33e334ecae5f5751381b686f1d978d73629dc1aaa4f87b8d0e53349f7338a')

package() {
  install -Dm755 trufflehog -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 generic.yml -t "$pkgdir/usr/share/doc/$pkgname/examples/"
}
