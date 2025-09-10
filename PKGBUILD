# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs

_pkgname=linutil
pkgname="$_pkgname-bin"
pkgver=2025.09.09
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
sha256sums_x86_64=('cdb0d47fff54edd11aab666256feaa5b5663bd76eac8b3a8c3b1296d8db5532e'
                   '89633413d90a770e7174c3f560886e8fd5a06bcac6b72077ccb23830b28c2466'
                   'e62a5bed2b3a5f80421827168ff10ff35388b39cf313d0a00e1f8cff841902a9'
                   '8d353e5a8bc69b891e948bd02afc9c05c0aff00c69279ca32f7b654b387792d6'
                   '79b3eb560ee97ff2aff5f6e0d2c15956bb06990cadf9796bd208d91db6b69477')
sha256sums_aarch64=('cdb0d47fff54edd11aab666256feaa5b5663bd76eac8b3a8c3b1296d8db5532e'
                    '89633413d90a770e7174c3f560886e8fd5a06bcac6b72077ccb23830b28c2466'
                    'e62a5bed2b3a5f80421827168ff10ff35388b39cf313d0a00e1f8cff841902a9'
                    '8d353e5a8bc69b891e948bd02afc9c05c0aff00c69279ca32f7b654b387792d6'
                    '79b3eb560ee97ff2aff5f6e0d2c15956bb06990cadf9796bd208d91db6b69477')
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
