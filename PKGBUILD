# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>
# Contributor: Lapis Apple <laple@pd2.ink>
# Contributor: 9r0k <tanyawei1991@gmail.com>
pkgname=com.kugou.spark
pkgver=10.2.46spark6
pkgrel=1
pkgdesc="Kugou Music Client from Spark Store"
arch=('i686' 'x86_64')
_arch=all
url="https://www.kugou.com/"
license=('unknown')
depends=(
  'bash'
  'deepin-wine6-stable'
  'hicolor-icon-theme'
  'spark-dwine-helper'
  # 'wine'
  'xdg-utils'
  'xdotool'
)
optdepends=(
  'wqy-microhei: Recommended font'
  'wqy-zenhei: Recommended font'
)
# install=kugou.install
_mirror="https://cdn.d.store.deepinos.org.cn"
# _mirror="https://mirrors.sdu.edu.cn/spark-store-repository"		# SDU mirror, sometimes outdated
source=("${_mirror}/store/music/${pkgname}/${pkgname}_${pkgver}_${_arch}.deb")
sha512sums=('dd8bf4558565e1c98fcc8dcd328cdbd186fb1109567d9d4ee965e442bce321d01f0e4fb3bfba0a767323c8410e698f0acaffb02aef300d8e19c2ea7c09b52f9a')

package() {
	cd "${pkgdir}"
	bsdtar -xpvf "${srcdir}/data.tar.xz"
  # sed -i 's/"deepin-wine6-stable"/"wine"/' opt/apps/${pkgname}/files/start.sh
  mkdir -p usr
  mv opt/apps/${pkgname}/entries usr/share
  rm opt/apps/com.kugou.spark/info
}
