# Maintainer: Dario Piombo <piombo.dario at gmail dot com>

pkgname=rdm-bin
pkgver=2021.6
pkgrel=1
pkgdesc='Cross-platform open source database management tool for Redis ®'
arch=('x86_64')
url="https://rdm.dev/"
license=('GPL3')
depends=(
  'qt5-base'
  'qt5-imageformats'
  'qt5-tools'
  'qt5-declarative'
  'qt5-quickcontrols'
  'qt5-quickcontrols2'
  'qt5-charts'
  'qt5-graphicaleffects'
  'qt5-svg'
  'python'
  'python-bitstring'
  'python-cbor'
  'python-phpserialize'
  'python-pandas'
  'python-msgpack')
conflicts=('redis-desktop-manager-bin' 'redis-desktop-manager')
provides=('rdm')
source=('rdm.desktop'
        "https://github.com/pidario/rdm-build/releases/download/${pkgver}/rdm-2021.6+2af6b98"
        'https://raw.githubusercontent.com/uglide/RedisDesktopManager/2021/src/resources/images/rdm.png')
sha256sums=('5e96ea919336c483fba09fd40839a77f33dc98a0aa5e9de0c7570d9fd888f62e'
            '4f939ad41436a9f178a53b3a68f4d187fdeffa2f93a4fffc3ed12930e2cfb3af'
            'SKIP')

package() {
  _bindir="$pkgdir/usr/bin"
  _pixdir="$pkgdir/usr/share/pixmaps"
  _appdir="$pkgdir/usr/share/applications"

  mkdir -p "${_bindir}"
  mkdir -p "${_pixdir}"
  mkdir -p "${_appdir}"

  install -Dm755 "$srcdir/rdm-2021.6+2af6b98" "${_bindir}/rdm"
  install -Dm644 "$srcdir/rdm.png" "${_pixdir}/rdm.png"
  install -Dm644 "$srcdir/rdm.desktop" "${_appdir}/rdm.desktop"
}
