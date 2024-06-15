# Maintainer: Eugene Babichenko <eugene.babichenko@gmail.com>

pkgname=fixit-bin
_pkgname="${pkgname/-bin}"
pkgver=0.3.1_beta
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
  "9da248775cf06b9f5ec24eac348eadd35758e5d69b1f9a15985295a84350093b"
  'SKIP'
  'SKIP'
)

source_aarch64=(
  "$_pkgname-aarch64-$_pkgver.tar.gz::$_releases-aarch64-$_linux.tar.gz"
  "$_readme"
  "$_license"
)
sha256sums_aarch64=(
  "9394996bd3452d9666e1cb676072a2da9fd9261076c30b641de9f3a93c5f672f"
  'SKIP'
  'SKIP'
)

package() {
  install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
