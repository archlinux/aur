# Maintainer: Minh Ha <minhha7036@gmail.com>
pkgname=zalo-elec-bin
_pkgname=zalo-elec
pkgver=1.0.0
pkgrel=1
pkgdesc="An Unofficial ZaloWeb Electron Application (Binary Release)"
arch=('x86_64')
url="https://github.com/haminh7036/zalo-elec"
license=('MIT')
depends=('alsa-lib' 'gtk3' 'libxss' 'nss' 'libxtst' 'libxcrypt-compat' 'at-spi2-core' 'libdrm' 'mesa')
provides=('zalo-elec')
conflicts=('zalo-elec')
options=('!strip' )

source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
  tar -xJf data.tar.xz -C "${pkgdir}"
  chmod -R 755 "${pkgdir}/opt/Zalo"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/Zalo/zalo" "${pkgdir}/usr/bin/zalo-elec"
}
