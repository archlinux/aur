# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=layerbase-bin
pkgver=0.36.11
pkgrel=1
pkgdesc="A beautiful GUI for managing all your local databases. Create, query, backup, and monitor PostgreSQL, MySQL, MongoDB, Redis, and more. No terminal required. (precompiled binary)"
url="https://layerbase.com"
arch=("x86_64")
depends=("libx11" "libxcomposite" "libxdamage" "libxext" "libxfixes" "libxrandr" "mesa" "nss" "alsa-lib" "at-spi2-core" "cups" "dbus" "expat" "libdrm" "libxkbcommon" "libxss")
makedepends=("libarchive")
options=("!strip")
license=("LicenseRef-PolyForm-Noncommercial-1.0.0")

source_x86_64=("layerbase-${pkgver}-amd64.deb::https://layerbase.com/api/download/linux?format=deb")
sha256sums_x86_64=('8ce577a35e20a595623cbcee6df72acf08496f3e1c456cde9722876588f3a7ff')

package() {
  bsdtar -xOf "${srcdir}/layerbase-${pkgver}-amd64.deb" data.tar.xz | bsdtar -xf - -C "${pkgdir}"
  chmod 4755 "${pkgdir}/opt/Layerbase/chrome-sandbox"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/Layerbase/layerbase-desktop" "${pkgdir}/usr/bin/layerbase"
}

