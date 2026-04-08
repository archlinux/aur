# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

# Co-Maintainer: Harsh Vyapari <harshvy5094@proton.me>
# https://github.com/harshv5094

_pkgname=linutil
pkgname="$_pkgname-bin"
pkgver=2026.03.06
pkgrel=1
pkgdesc="Distro-agnostic toolbox designed to simplify everyday Linux tasks"
arch=('x86_64' 'aarch64')
url="https://github.com/ChrisTitusTech/$_pkgname"
_url_raw="https://raw.githubusercontent.com/$(echo "$url" | awk -F'/' '{print $4 "/" $5}')"
license=('MIT')
source_x86_64=("$_pkgname-$pkgver::$url/releases/download/$pkgver/$_pkgname"
  "$_pkgname-$pkgver.1::$_url_raw/refs/tags/$pkgver/man/$_pkgname.1"
  "$_pkgname-$pkgver.desktop::$_url_raw/refs/tags/$pkgver/$_pkgname.desktop"
  "LICENSE-$pkgver::$_url_raw/refs/tags/$pkgver/LICENSE"
  "README-$pkgver.md::$_url_raw/refs/tags/$pkgver/README.md")
source_aarch64=("$_pkgname-$pkgver::$url/releases/download/$pkgver/$_pkgname-aarch64"
  "$_pkgname-$pkgver.1::$_url_raw/refs/tags/$pkgver/man/$_pkgname.1"
  "$_pkgname-$pkgver.desktop::$_url_raw/refs/tags/$pkgver/$_pkgname.desktop"
  "LICENSE-$pkgver::$_url_raw/refs/tags/$pkgver/LICENSE"
  "README-$pkgver.md::$_url_raw/refs/tags/$pkgver/README.md")
sha256sums_x86_64=('8ded20c258a3eea77f8450666ba6628aee4b0e73d00b32f719a45b9a157f60e1'
  '513b5df85842d709232c120b869f86ca8be9794a9144be5d54c7d8a9c95c2975'
  'e62a5bed2b3a5f80421827168ff10ff35388b39cf313d0a00e1f8cff841902a9'
  '8d353e5a8bc69b891e948bd02afc9c05c0aff00c69279ca32f7b654b387792d6'
  '9581de97fa8c8f99db8559e4a0638f25c88675a7c6173bd57e30e74e0089f5e0')
sha256sums_aarch64=('8ded20c258a3eea77f8450666ba6628aee4b0e73d00b32f719a45b9a157f60e1'
  '513b5df85842d709232c120b869f86ca8be9794a9144be5d54c7d8a9c95c2975'
  'e62a5bed2b3a5f80421827168ff10ff35388b39cf313d0a00e1f8cff841902a9'
  '8d353e5a8bc69b891e948bd02afc9c05c0aff00c69279ca32f7b654b387792d6'
  '9581de97fa8c8f99db8559e4a0638f25c88675a7c6173bd57e30e74e0089f5e0')
depends=('git' 'pacman')
optdepends=('ttf-nerd-fonts-symbols: symbols and icons')
conflicts=("$_pkgname")
provides=("$_pkgname")

prepare() {
  echo "Version=$pkgver" >>"$_pkgname-$pkgver.desktop"
}

package() {
  cd "$srcdir"

  install -Dm0755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname-$pkgver.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
  install -Dm644 "$_pkgname-$pkgver.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: ts=2 sw=2 et:
