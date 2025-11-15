# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=crossdirstat
pkgname=${_basename}-bin
pkgver=2.5.0
pkgrel=1
pkgdesc="Free open-source cross-platform file & directory statistics"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/Jelmerro/crossdirstat"
license=('MIT')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('glibc' 'gcc-libs' 'glib2' 'systemd-libs' 'dbus' 'gtk3' 'mesa' 'nspr' 'libxkbcommon' 'libxdamage' 'libxfixes' 'libxrandr' 'libxext' 'libxcb' 'expat' 'libx11' 'libxcomposite' 'libcups' 'alsa-lib' 'pango' 'cairo' 'nss' 'at-spi2-core' 'hicolor-icon-theme')
source_x86_64=("${url}/releases/download/${pkgver}/${_basename}_${pkgver}_${_barch[0]}.deb")
source_aarch64=("${url}/releases/download/${pkgver}/${_basename}_${pkgver}_${_barch[1]}.deb")
sha256sums_x86_64=('a398e132527d06fa159b866667e89466ac4a3b393bf285a7884f60f46d69fc05')
sha256sums_aarch64=('0cfcd9b9ac418cf645e3552f11155ba5eb94e58d8d15ef4cb187b423daa9734e')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.xz"

    install -dm755 "${pkgdir}/usr/bin/"
    ln -sf "/opt/Crossdirstat/crossdirstat" "${pkgdir}/usr/bin/${_basename}"
} 
