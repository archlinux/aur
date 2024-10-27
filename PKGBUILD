# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
# Contributor: Lapis Apple <laple@pd2.ink>
# Contributor: 9r0k <tanyawei1991@gmail.com>
pkgname=com.kugou.spark
pkgver=11.0.82spark7
pkgrel=1
pkgdesc="Kugou Music Client from Spark Store"
arch=('any')
_arch=all
url="https://www.kugou.com/"
license=('unknown')
depends=(
  'bash'
  'deepin-wine6-stable'
  'hicolor-icon-theme'
  'spark-dwine-helper'
  'xdg-utils'
  'xdotool'
)
optdepends=(
  'wqy-microhei: Recommended font'
  'wqy-zenhei: Recommended font'
)
# install=kugou.install
# _mirror="https://cdn.d.store.deepinos.org.cn"  # main server
_mirror="https://mirrors.sdu.edu.cn/spark-store-repository"		# SDU mirror, sometimes outdated
source=("${_mirror}/store/music/${pkgname}/${pkgname}_${pkgver}_${_arch}.deb")
sha512sums=('3dc426d8d0f4b5d0c7870aca0b18074c23a70b176e91e060b32ce6c121e29de54cfdf47ebcc101f515138190d3b07f512baaef7a98ff05f22b95a0fa85c73a65')

package() {
	cd "${pkgdir}"
	bsdtar -xpvf "${srcdir}/data.tar.xz"
  mkdir -p usr
  mv opt/apps/${pkgname}/entries usr/share
  rm opt/apps/com.kugou.spark/info
  chmod -R g-w .
}
