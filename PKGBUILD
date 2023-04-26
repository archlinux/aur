# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=grinplusplus-bin
pkgver=1.2.8
pkgrel=1
pkgdesc='A C++ Grin Node & Wallet For Linux'
arch=('x86_64')
url="https://grinplusplus.github.io"
_githuburl="https://github.com/GrinPlusPlus/GrinPlusPlus"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('gtk3' 'libxdamage' 'nss' 'nodejs' 'openssl-1.1' 'alsa-lib' 'libevent' 'hicolor-icon-theme' 'cairo' \
  'glibc' 'pango' 'libxext' 'libxfixes' 'expat' 'libcups' 'util-linux-libs' 'gdk-pixbuf2' 'libxcomposite' 'libdrm' \
  'libxkbcommon' 'libxrandr' 'at-spi2-core' 'gcc-libs' 'libxcb' 'glib2' 'mesa' 'sh' 'libx11' 'zlib' 'dbus' 'nspr')
makedepends=()
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/GrinPlusPlus.${pkgver}.deb"
        "LICENSE::${_githuburl}/raw/master/LICENSE")
sha256sums=('9d331477bec4bf78a54e0169ca862d5a269ca5e62ec27fc2897a0e6916d5621a'
            'a5e9383c3cb97aa3034e5e4bf1c94a71db0c59b3a7ec1fbf198232fb9dcc5e53')

package() {
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}