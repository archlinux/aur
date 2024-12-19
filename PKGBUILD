# Maintainer: tarball <bootctl@gmail.com>

pkgname=trufflehog-bin
pkgver=3.87.1
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
sha256sums_x86_64=('49acfd8584d7db0904e03867be3de8ff91fc3125b604744bed87e88048da569b')
sha256sums_aarch64=('f6425bb3d894f5dccae5c6d51b94bb49b892ca8e178ca86cc5dde27263f7c392')

package() {
  install -Dm755 trufflehog -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 generic.yml -t "$pkgdir/usr/share/doc/$pkgname/examples/"
}
