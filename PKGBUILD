# Maintainer: Eugene Babichenko <eugene.babichenko@gmail.com>

pkgname=fixit-bin
_pkgname="${pkgname/-bin}"
pkgver=0.3.0_beta
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
  "7b2f853b9001a39a47bebc083db988f67c01b05d1d8daaade52aa03ac3bce853"
  'SKIP'
  'SKIP'
)

source_aarch64=(
  "$_pkgname-aarch64-$_pkgver.tar.gz::$_releases-aarch64-$_linux.tar.gz"
  "$_readme"
  "$_license"
)
sha256sums_aarch64=(
  "57a51bbbef820896ee47533cf2597af5b300aed2eacf9778cc485df1e4add9c2"
  'SKIP'
  'SKIP'
)

package() {
  install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}
