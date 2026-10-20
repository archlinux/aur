# Maintainer: Doridian <doridian at foxden dot network>

pkgname=zeroconnect-bin
_pkgname=zeroconnect
pkgver=2.6.1
pkgrel=1
pkgdesc="File exchange application for Zero calculators (ZGC4)"
arch=('x86_64')
url="https://zerocalculators.com/downloads"
license=('LicenseRef-Proprietary')
depends=(
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'qt5-base'
  'qt5-declarative'
  'qt5-quickcontrols'
  'qt5-quickcontrols2'
  'qt5-serialport'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
install="$pkgname.install"
source=("https://storage.googleapis.com/zerocalculators-downloads/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('47f597e863a84216feba6cc855532d94a99d4510cb133c52ad2d1dcb6f029a2c')

package() {
  bsdtar -xf data.tar.zst -C "$pkgdir"
  install -Dm644 "$pkgdir/usr/share/doc/$_pkgname/copyright" \
    "$pkgdir/usr/share/licenses/$pkgname/copyright"
  rm -f "$pkgdir/usr/share/doc/$_pkgname/changelog.Debian.gz"
}
