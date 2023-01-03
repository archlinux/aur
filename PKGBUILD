# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Leonidas Arvanitis <l.arvanitis@gmail.com>

pkgname=pencil-bin
pkgver=3.1.1
pkgrel=1
pkgdesc="Sketching and GUI prototyping/wireframing tool"
arch=(x86_64)
url="http://pencil.evolus.vn/"
license=(GPL2)
depends=(alsa-lib gtk3 nss)
provides=(pencil)
conflicts=(pencil)
replaces=(evolus-pencil-bin)
source=("https://pencil.evolus.vn/dl/V${pkgver}.ga/Pencil_${pkgver}.ga_amd64.deb")
sha256sums=('b05492667f78d3aa5f548618d35f52c3385d4e8844a8e4d885f69d2d85040c02')

package() {
  bsdtar -xJf data.tar.xz -C "${pkgdir}/"
  install -d "${pkgdir}/usr/bin/"
  ln -s "/opt/Pencil/pencil" "${pkgdir}/usr/bin/pencil"

  rm -r "${pkgdir}/usr/share/doc"
}
