# Maintainer: tarball <bootctl@gmail.com>

pkgname=trufflehog-bin
pkgver=3.82.4
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
sha256sums_x86_64=('1455296155da224a767e68fb8a88ae80adb45299b1a7dbd037151ae877694e4e')
sha256sums_aarch64=('7119b2198b9329a05bf8e69f8c7e1967a952dbb390cc3340862f62edec4d7d6b')

package() {
  install -Dm755 trufflehog -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 generic.yml -t "$pkgdir/usr/share/doc/$pkgname/examples/"
}
