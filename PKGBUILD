# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

_pkgname=linutil
pkgname="$_pkgname-bin"
pkgver=2025.02.13
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
sha256sums_x86_64=('9af55b6b530277d09126722174d3f1fdd35441e64cf3d398590c13469eafeb8d'
                   '89633413d90a770e7174c3f560886e8fd5a06bcac6b72077ccb23830b28c2466'
                   'e62a5bed2b3a5f80421827168ff10ff35388b39cf313d0a00e1f8cff841902a9'
                   '8d353e5a8bc69b891e948bd02afc9c05c0aff00c69279ca32f7b654b387792d6'
                   'a90fcf25870db5203115322e8438969d003591b5a1a5f66750baf9501d12cc8b')
sha256sums_aarch64=('9af55b6b530277d09126722174d3f1fdd35441e64cf3d398590c13469eafeb8d'
                    '89633413d90a770e7174c3f560886e8fd5a06bcac6b72077ccb23830b28c2466'
                    'e62a5bed2b3a5f80421827168ff10ff35388b39cf313d0a00e1f8cff841902a9'
                    '8d353e5a8bc69b891e948bd02afc9c05c0aff00c69279ca32f7b654b387792d6'
                    'a90fcf25870db5203115322e8438969d003591b5a1a5f66750baf9501d12cc8b')
depends=('git' 'pacman')
optdepends=('ttf-nerd-fonts-symbols: symbols and icons')
conflicts=("$_pkgname")
provides=("$_pkgname")

prepare() {
  echo "Version=$pkgver" >> "$_pkgname-$pkgver.desktop"
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
