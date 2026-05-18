# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=Athas
pkgname=${_basename,,}-bin
pkgver=0.7.0
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
sha256sums_x86_64=('2a565cfdc64f302b471e1af34807b138629a2f307a2a02058435ca3bc827ce88')
sha256sums_aarch64=('4b2368293841dd7a5f04ac5a39f1b3362f8babb57e2949a36bac3a6e101c4b0f')


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

