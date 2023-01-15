# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
# Contributor: Lapis Apple <laple@pd2.ink>
# Contributor: 9r0k <tanyawei1991@gmail.com>
pkgname=com.kugou.spark
pkgver=10.1.12spark4
pkgrel=1
epoch=
pkgdesc="Kugou Music Client from Spark Store"
arch=('i686' 'x86_64')
url="https://www.kugou.com/"
license=('unknown')
groups=()
depends=(
  'spark-dwine-helper'
  'wine'
  'xdg-utils'
  'xdotool'
)
checkdepends=()
optdepends=(
  'wqy-microhei: Recommended font'
  'wqy-zenhei: Recommended font'
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
# install=kugou.install
changelog=
source=("https://mirrors.sdu.edu.cn/spark-store-repository/store/music/${pkgname}/${pkgname}_${pkgver}_i386.deb")
sha512sums=('b47a47321065d7efecc20f73676f6383d995456c3692899d9046c4a68c109614d3603aab237b8c35d9cdc5092eb0ca5c7db4b46cf255272d7bd85482be4dea44')
validpgpkeys=()

package() {
	cd "${pkgdir}"
	bsdtar -xpvf "${srcdir}/data.tar.xz"
  sed -i 's/"deepin-wine6-stable"/"wine"/' opt/apps/${pkgname}/files/start.sh
  mkdir usr
  mv opt/apps/${pkgname}/entries usr/share
  rm opt/apps/com.kugou.spark/info
}
