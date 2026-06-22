# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=layerbase-bin
pkgver=0.29.11
pkgrel=1
pkgdesc="A beautiful GUI for managing all your local databases. Create, query, backup, and monitor PostgreSQL, MySQL, MongoDB, Redis, and more. No terminal required. (precompiled binary)"
url="https://layerbase.com"
arch=("x86_64")
depends=("libx11" "libxcomposite" "libxdamage" "libxext" "libxfixes" "libxrandr" "mesa" "nss" "alsa-lib" "at-spi2-core" "cups" "dbus" "expat" "libdrm" "libxkbcommon" "libxss")
makedepends=("libarchive")
options=("!strip")
license=("LicenseRef-PolyForm-Noncommercial-1.0.0")

source_x86_64=("layerbase-${pkgver}-amd64.deb::https://layerbase.com/api/download/linux?format=deb")
sha256sums_x86_64=('a6eb079c3c856efc05e4e64585b9ad8d6e95a141df07cd6b0a87d089b6b14b90')

package() {
  bsdtar -xOf "${srcdir}/layerbase-${pkgver}-amd64.deb" data.tar.xz | bsdtar -xf - -C "${pkgdir}"
  chmod 4755 "${pkgdir}/opt/Layerbase/chrome-sandbox"
  install -dm755 "${pkgdir}/usr/bin"
  ln -sf "/opt/Layerbase/layerbase-desktop" "${pkgdir}/usr/bin/layerbase"
}

