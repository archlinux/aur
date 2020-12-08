# Maintainer:  Jason Wang <wang_borong@163.com>

pkgname=beam-bin
pkgver=0.1.19
pkgrel=1
pkgdesc='Free desktop application that delivers fast, reliable and secure access to the open Internet. (Stable Channel, binary)'
arch=('i686' 'x86_64')
url='https://github.com/xiaoshoudian/xiazai'
license=('Apache')
depends=('libappindicator-gtk3')
options=('!emptydirs' '!strip' '!docs')
provides=('beam')
source=('beam.service')
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/xiaoshoudian/xiazai/raw/main/beam-installer-64-bit.deb")
sha256sums=('ebfb9ed2fe3d0c495c8e3af3beba1f907f67b43e9354726c4912fb2176fef298')
sha256sums_x86_64=('d78fd7cd89373fe983daff9f881509fcbcbe94c37dea973c6dd75b09325b978e')

package() {
    msg2 'Extracting the data.tar.xz...'
    bsdtar -xzf data.tar.gz -C "${pkgdir}/"

    msg2 'Install systemd service file...'
    install -Dm644 "${srcdir}/beam.service" "${pkgdir}/usr/lib/systemd/user/beam.service"
}
