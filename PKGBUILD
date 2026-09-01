# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=Athas
pkgname=${_basename,,}-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Lightweight code editor built with React, TypeScript, and Tauri"
arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')
url="https://github.com/athasdev/athas"
license=('AGPL-3.0-or-later')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('glibc' 'gcc-libs' 'zlib' 'gdk-pixbuf2' 'libsoup3' 'xz' 'cairo' 'gtk3' 'glib2' 'webkit2gtk-4.1' 'hicolor-icon-theme')

source_x86_64=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('10e5d4d4c84b574f2625d92deff147ced2bff6a67d6a29b3f3766afe63a19835')
sha256sums_aarch64=('495b4249f44a62d9887eba014ab22ca85719a86569e2db7532f6781d220cb674')


package() {
    install -dm755 "${pkgdir}/opt/Athas"
    cp -rf "${srcdir}/athas.app/bin" "${pkgdir}/opt/Athas/"
    cp -rf "${srcdir}/athas.app/lib" "${pkgdir}/opt/Athas/"
    cp -rf "${srcdir}/athas.app/libexec" "${pkgdir}/opt/Athas/"

    install -dm755 "${pkgdir}/usr"
    cp -rf "${srcdir}/athas.app/share" "${pkgdir}/usr/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/Athas/bin/athas" "${pkgdir}/usr/bin/athas"
}

