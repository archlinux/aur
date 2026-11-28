# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=curium-bin
pkgver=0.6.4
pkgrel=1
pkgdesc="Ad-free QR code customizer, generator and scanner"
arch=('x86_64' 'aarch64')
url="https://github.com/nylxar/curium"
license=('AGPL-3.0-only')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgcc' 'libsoup3' 'openssl-3' 'webkit2gtk-4.1')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/nylxar/curium/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/curium_${pkgver}_linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/curium_${pkgver}_linux-aarch64.tar.gz")
sha256sums=('0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0')
sha256sums_x86_64=('06454049c4d0601a8bc8955d0a3a75639521e3b7567ac5dfdd72f5416387a186')
sha256sums_aarch64=('8b934d151faf4f2969be8640c319df18ce04fb5312f32e500ca0953d7c345efa')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="curium-${pkgver}-linux-x86_64/bin" ;;
    aarch64) _dir="curium-${pkgver}-linux-aarch64/bin" ;;
  esac
  install -Dm755 "${_dir}/curium" "${pkgdir}/usr/bin/curium"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
