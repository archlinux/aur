# Maintainer: 懵仙兔兔 <acgm@qq.com>
# Maintainer: wearzdk <hi@wearzdk.me>
pkgname=com.qq.weixin.mejituu
pkgver=3.9.9.43_plus_Mejituu_2024022102
pkgrel=1
pkgdesc="Tencent WeChat Client from Spark Store (Mejituu version). Wine 微信客户端 （懵仙兔兔）"
arch=('x86_64')
_arch=all
url="https://weixin.qq.com/"
license=('unknown')
depends=(
	'libjpeg6-turbo'
	'xdotool'
	'zenity'
	'rsync'
	'mejituu-wine8'
	'spark-dwine-helper'
	'xdg-utils'
)
optdepends=(
	'wqy-microhei: Recommended font'
	'wqy-zenhei: Recommended font'
)
install=wechat.install
_mirror="https://cdn.d.store.deepinos.org.cn"
# _mirror="https://mirrors.sdu.edu.cn/spark-store-repository"		# SDU mirror, sometimes outdated
source=("${_mirror}/store/chat/${pkgname}/${pkgname}_3.9.9.43_plus_Mejituu-2024022102_${_arch}.deb")
b2sums=('047dd3d1ac7ed05e604e20de1b84510bc6729d485c88878f0d02fa9b3248f9231d3cc60bb9849c135cbc5e3c7c4c55480ca565c8bfed325d2e2c81a0122d483f')

package() {
	cd "${pkgdir}"
	bsdtar -xpvf "${srcdir}/data.tar.xz"
	install -d usr/share
	rsync -av --remove-source-files opt/apps/${pkgname}/entries/ usr/share/
	rm -rf opt/apps/${pkgname}/entries/
	rm opt/apps/${pkgname}/info
}
