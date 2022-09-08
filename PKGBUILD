# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
# Contributor: zzy-ac <1304024859@qq.com>
pkgname=cn.189.cloud.spark
pkgver=6.4.5spark3
pkgrel=1
epoch=
pkgdesc="China Telecom eCloud Client (from Spark Store)"
arch=('i686' 'x86_64')
url="https://cloud.189.cn/"
license=('unknown')
groups=()
depends=(
  'spark-dwine-helper'
  'wine'
  'xdg-utils'
)
checkdepends=()
optdepends=(
  'wqy-microhei: Recommended font'
  'wqy-zenhei: Recommended font'
)
backup=()
options=()
# install=cn.189.cloud.spark.install
changelog=
source=("https://mirrors.sdu.edu.cn/spark-store-repository/store/network/${pkgname}/${pkgname}_${pkgver}_i386.deb")
b2sums=('9ac72b17cae5a99277d287f6604948077cf6f4ead2436bc82538a10d91a2e2833ad4cd5b9e59a819beb4e380a28ecbd1ec8f91b3987ad357e68e89b8069e4b82')

package() {
	cd "${pkgdir}"
	install -d usr
  bsdtar -xpvf "${srcdir}/data.tar.xz"
  sed -i 's/"deepin-wine6-stable"/"wine"/' opt/apps/${pkgname}/files/run.sh
  mv opt/apps/${pkgname}/entries usr/share
  rm opt/apps/${pkgname}/info
}
