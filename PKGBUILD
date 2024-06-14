# Maintainer: Eugene Babichenko <eugene.babichenko@gmail.com>

pkgname=fixit-bin
_pkgname="${pkgname/-bin}"
pkgver=0.2.0_alpha
_pkgver="${pkgver//_/-}"
pkgrel=1
_repo="eugene-babichenko/$_pkgname"
url="https://github.com/$_repo"
pkgdesc="A utility to fix mistakes in your commands."
license=('MIT')
arch=('x86_64' 'aarch64')

_releases="$url/releases/download/v$_pkgver/$_pkgname-v$_pkgver"
_tree="https://raw.githubusercontent.com/$_repo/v$_pkgver"
_readme="$_tree/README.md"
_license="$_tree/LICENSE"
_linux="unknown-linux-musl"

source_x86_64=(
  "$_pkgname-x86_64-$_pkgver.tar.gz::$_releases-x86_64-$_linux.tar.gz"
  "$_readme"
  "$_license"
)
sha256sums_x86_64=(
  "4f0d8466456f89951327f4ccb55e61402d47b2e0c51706b5422d6596275f8c6e"
  'SKIP'
  'SKIP'
)

source_aarch64=(
  "$_pkgname-aarch64-$_pkgver.tar.gz::$_releases-aarch64-$_linux.tar.gz"
  "$_readme"
  "$_license"
)
sha256sums_aarch64=(
  "e66b5c3845e32b8008d7ad8227ada15989ffa7161b9d87f59ac864668b03fbcd"
  'SKIP'
  'SKIP'
)

package() {
  install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
