# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
# Contributor: Lapis Apple <laple@pd2.ink>
# Contributor: 9r0k <tanyawei1991@gmail.com>
pkgname=com.kugou.spark
pkgver=10.1.93spark5
pkgrel=1
pkgdesc="Kugou Music Client from Spark Store"
arch=('i686' 'x86_64')
url="https://www.kugou.com/"
license=('unknown')
depends=(
  'bash'
  'hicolor-icon-theme'
  'spark-dwine-helper'
  'wine'
  'xdg-utils'
  'xdotool'
)
optdepends=(
  'wqy-microhei: Recommended font'
  'wqy-zenhei: Recommended font'
)
# install=kugou.install
source=("https://mirrors.sdu.edu.cn/spark-store-repository/store/music/${pkgname}/${pkgname}_${pkgver}_i386.deb")
sha512sums=('d42a4f74253b260bf7d37205fbb53f0d0904df5a7cec5a98b20f8b12361947d8c2f7fde9649b17b35f8cd289b80a50209c4f8c754e076b8b6b3c921479a8580d')

package() {
	cd "${pkgdir}"
	bsdtar -xpvf "${srcdir}/data.tar.xz"
  sed -i 's/"deepin-wine6-stable"/"wine"/' opt/apps/${pkgname}/files/start.sh
  mkdir usr
  mv opt/apps/${pkgname}/entries usr/share
  rm opt/apps/com.kugou.spark/info
}
