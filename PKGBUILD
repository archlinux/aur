# Maintainer: samedamci <samedamci@disroot.org>

pkgname=rofi-mpd
pkgver=1.0
pkgrel=1
pkgdesc="Script for controlling mpd through rofi"
arch=('any')
url="https://github.com/samedamci/rofi-mpd"
license=('MIT')
depends=(
    'mpc'
    'mpd'
    'rofi')
provides=('rofi-mpd')
source=("https://github.com/samedamci/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('90c6079e636cbbf0ed93d017c9c4011f4121b653b113f38289e7682005803809')


package() {
  cd "$pkgname-$pkgver" || exit 1
  local doc_path="$pkgdir/usr/share/doc/${pkgname}"

  install -Dm755 "rofi-mpd" "$pkgdir/usr/bin/${pkgname}"

  install -Dm755 -d "$pkgdir/usr/share/doc/${pkgname}"

  install -Dm644 "README.md" "${doc_path}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
