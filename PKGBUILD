# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=Athas
pkgname=${_basename,,}-bin
pkgver=0.8.0
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
sha256sums_x86_64=('ed503598a19f5b5aaad4f7b7510c5bb1914676f47c6d1369a9b7d0ada555169b')
sha256sums_aarch64=('6d829e1f2be1fe3af9ea37feabd382bb1ab0fa4f22d1b9c0103c037fed3fe299')


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

