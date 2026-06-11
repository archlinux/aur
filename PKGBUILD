# Maintainer: emixdy <emixdy@github>
_pkgname=capi-desktop
pkgname="${_pkgname}-bin"
pkgver=0.1.0
pkgrel=1
pkgdesc="Cliente gráfico para YouTube Music con soporte de descargas y Discord RPC"
arch=('x86_64')
url="https://github.com/jh2929/Capi"
license=('MIT')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'libayatana-appindicator'
  'libsoup3'
  'glib2'
  'gcc-libs'
  'zlib'
  'openssl'
)
makedepends=()
optdepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/releases/download/v${pkgver}/capi-desktop-linux-x86_64.tar.gz")
sha256sums=('46502b9fe73635719225ec5694a14ee564f49985562846d89216a9ab9cfc165b')
noextract=()

package() {
  cd "${srcdir}"

  install -Dm755 usr/bin/capi-desktop "${pkgdir}/usr/bin/capi-desktop"
  install -Dm755 usr/lib/capi/bin/capi-core "${pkgdir}/usr/lib/capi/bin/capi-core"
  install -Dm644 usr/share/applications/capi-desktop.desktop "${pkgdir}/usr/share/applications/capi-desktop.desktop"
  install -Dm644 usr/share/icons/hicolor/128x128/apps/capi-desktop.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/capi-desktop.png"
  install -Dm644 usr/share/icons/hicolor/256x256/apps/capi-desktop.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/capi-desktop.png"
}
