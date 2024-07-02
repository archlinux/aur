# Maintainer: Eugene Babichenko <eugene.babichenko@gmail.com>

pkgname=fixit-bin
_pkgname="${pkgname/-bin}"
pkgver=0.4.0_beta
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
  "0baf14e635f0dcb065328c6fe0e207a9bbe2e6e42e55c2f3e327c8df53aed957"
  'SKIP'
  'SKIP'
)

source_aarch64=(
  "$_pkgname-aarch64-$_pkgver.tar.gz::$_releases-aarch64-$_linux.tar.gz"
  "$_readme"
  "$_license"
)
sha256sums_aarch64=(
  "4247b5aa8003e70ec062c7360afd748f312ec8b1aa9ba95c32dd92edd53cdb05"
  'SKIP'
  'SKIP'
)

package() {
  install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
