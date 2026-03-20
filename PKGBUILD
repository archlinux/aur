# Maintainer: mistweaverco <oss@mistweaverco.com>

# INFO:
# This is prefixed with "mw-" to avoid
# confusion with the already existing "timetrack" gnome package that exist in the AUR.
# The actual application is called "timetrack", and that's what the binary will be named.
pkgname=mw-timetrack-bin
_pkgname=timetrack
pkgver=5.13.0
pkgrel=1
pkgdesc="Simple, offline-first desktop application to track your time on different projects and tasks."
arch=('x86_64')
url="https://github.com/mistweaverco/timetrack"
license=('MIT')
depends=('nss' 'at-spi2-core' 'libxss' 'gtk3' 'alsa-lib' 'libxtst')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://github.com/mistweaverco/timetrack/releases/download/v${pkgver}/timetrack_amd64.deb")
sha256sums=('7d7433dff09899958401a1719ad9060e8ae25779bd6d5e7504ee4fde5b828f68')

package() {
  tar -xJf data.tar.xz -C "${pkgdir}"
  chmod -R 755 "${pkgdir}/usr/share/$_pkgname"
  install -d "${pkgdir}/usr/bin"
  ln -sf "/usr/lib/$_pkgname/$_pkgname" "${pkgdir}/usr/bin/$_pkgname"
}
