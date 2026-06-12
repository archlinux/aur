# Maintainer: emixdy <emixdy@github>
_pkgname=capi-desktop
_pkgtag=linux
pkgname="${_pkgname}-bin"
pkgver=0.1.0
pkgrel=3
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
source=("${url}/releases/download/v${pkgver}-${_pkgtag}/capi-desktop-linux-x86_64.tar.gz")
sha256sums=('54887d09724d7db9be8bcecbe34f18ef1ca597340e2629bb781fbe203175c22e')
noextract=()

package() {
  cd "${srcdir}"

  install -Dm755 usr/bin/capi-desktop "${pkgdir}/usr/bin/capi-desktop"
  install -Dm755 usr/lib/capi/bin/capi-core "${pkgdir}/usr/lib/capi/bin/capi-core"
  install -Dm644 usr/share/applications/capi-desktop.desktop "${pkgdir}/usr/share/applications/capi-desktop.desktop"
  install -Dm644 usr/share/icons/hicolor/128x128/apps/capi-desktop.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/capi-desktop.png"
  install -Dm644 usr/share/icons/hicolor/256x256/apps/capi-desktop.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/capi-desktop.png"
}
