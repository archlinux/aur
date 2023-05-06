# Maintainer: Dario Piombo <piombo.dario at gmail dot com>

pkgname=rdm-bin
pkgver=2022.6
pkgrel=2
pkgdesc='Cross-platform open source database management tool for Redis ®'
arch=('x86_64')
url="https://resp.app/"
license=('GPL3')
depends=(
  'qt5-charts'
  'qt5-quickcontrols'
  'qt5-quickcontrols2'
  'qt5-svg'
  'brotli'
  'python>=3.11'
  'snappy'
)
conflicts=('redis-desktop-manager-bin' 'redis-desktop-manager')
provides=('rdm' 'resp')
source=('rdm.desktop'
        "https://github.com/pidario/rdm-build/releases/download/${pkgver}/rdm-2022.6+3147597"
        'https://raw.githubusercontent.com/uglide/RedisDesktopManager/2022/src/resources/images/resp.png')
sha256sums=('5e96ea919336c483fba09fd40839a77f33dc98a0aa5e9de0c7570d9fd888f62e'
            '3b65f346f71ec96787c28541d7ae99f6f36ed8b10eafe801ac91131d8817288b'
            'SKIP')

package() {
  _bindir="$pkgdir/usr/bin"
  _pixdir="$pkgdir/usr/share/pixmaps"
  _appdir="$pkgdir/usr/share/applications"

  mkdir -p "${_bindir}"
  mkdir -p "${_pixdir}"
  mkdir -p "${_appdir}"

  install -Dm755 "$srcdir/rdm-2022.6+3147597" "${_bindir}/rdm"
  install -Dm644 "$srcdir/resp.png" "${_pixdir}/rdm.png"
  install -Dm644 "$srcdir/rdm.desktop" "${_appdir}/rdm.desktop"
}
