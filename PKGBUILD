# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Leonidas Arvanitis <l.arvanitis@gmail.com>

pkgname=pencil-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="Sketching and GUI prototyping/wireframing tool"
arch=(x86_64)
url="http://pencil.evolus.vn/"
license=(GPL2)
depends=(gtk3 libxss nss)
provides=(pencil)
conflicts=(pencil)
replaces=(evolus-pencil-bin)
source=("https://pencil.evolus.vn/dl/V${pkgver}.ga/pencil_${pkgver}.ga_amd64.deb")
sha256sums=('01ae54b1a1351b909eb2366c6ec00816e1deba370e58f35601cf7368f10aaba3')

package() {
  bsdtar -xJf data.tar.gz -C "${pkgdir}/"
  install -d "${pkgdir}/usr/bin/"
  ln -s "/opt/pencil-${pkgver}.ga/pencil" "${pkgdir}/usr/bin/pencil"

  install -d "${pkgdir}/usr/share/applications/"
  mv "${pkgdir}/opt/pencil-${pkgver}.ga/pencil.desktop" "${pkgdir}/usr/share/applications/"
  mv "${pkgdir}/opt/pencil-${pkgver}.ga/pencil.png" "${pkgdir}/usr/share/applications/"

  rm -r "${pkgdir}/usr/share/doc"
}
