# Maintainer: Eugene Babichenko <eugene.babichenko@gmail.com>

pkgname=fixit-bin
_pkgname="${pkgname/-bin}"
pkgver=0.1.0_alpha
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
  "5c31e3a72ae1aad59c57c37520c90e6d30a90d3d0f93143b9caf55f717e56d50"
  'SKIP'
  'SKIP'
)

source_aarch64=(
  "$_pkgname-aarch64-$_pkgver.tar.gz::$_releases-aarch64-$_linux.tar.gz"
  "$_readme"
  "$_license"
)
sha256sums_aarch64=(
  "148ee94c0f9abfca7d8402507471499f0282602e0831a4e9a17c6b609d28ed71"
  'SKIP'
  'SKIP'
)

package() {
  install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
