pkgname=tamery-bin
pkgver=0.99.3
pkgrel=1
pkgdesc="AI-powered tool for working with Postgres, MySQL, MSSQL, ClickHouse and SQLite."
arch=('x86_64')
url="https://tamery.app"
license=('AGPL-3.0-or-later')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
)
provides=('tamery')
conflicts=('tamery')
options=('!strip' '!emptydirs')
source_x86_64=("tamery-${pkgver}.deb::https://download.tamery.app/versions/${pkgver}/linux/deb/x64")
sha256sums_x86_64=('c5a009b1e718061cf2ff83d503febe1ddd630c6cc98d992b1795d63fac888273')

package() {
  bsdtar -xf data.tar.xz -C "${pkgdir}"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/Tamery/tamery-desktop "${pkgdir}/usr/bin/tamery"
}
