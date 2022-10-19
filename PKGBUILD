# Maintainer: Kimiblock Zhou <pn3535 at icloud dot com>
pkgname=electronic-wechat-uos-bin
pkgver=1
pkgrel=1
epoch=
pkgdesc="Linux 下更好用的微信客户端. 更多功能, 更少bug. 使用Electron构建, 利用UOS请求头修复了登陆问题."
arch=('x86_64')
url="https://github.com/Riceneeder/electronic-wechat"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(electronic-wechat)
conflicts=()
replaces=()
install=
source=(
	electronic-wechat-uos-bin
	electronic-wechat-uos-bin.desktop
	electronic-wechat-uos-bin.svg
	wechat-${pkgver}.tar.gz::"https://github.com/Riceneeder/electronic-wechat/releases/download/v2.3.1.fix/electronic-wechat-linux-x64.tar.gz"
)
noextract=()
md5sums=(
	'SKIP'
	'SKIP'
	'SKIP'
	'SKIP'
)
validpgpkeys=()
package() {
 	tar -xvzf wechat-${pkgver}.tar.gz
	for directory in /usr/bin /opt/electronic-wechat-uos-bin /usr/share/applications; do
		mkdir -p ${pkgdir}${directory}
	done
	cp -r ${srcdir}/electronic-wechat-linux-x64/* electronic-wechat-uos-bin.svg ${pkgdir}/opt/electronic-wechat-uos-bin
	cp ${srcdir}/electronic-wechat-uos-bin.desktop ${pkgdir}/usr/share/applications
	cp ${srcdir}/electronic-wechat-uos-bin ${pkgdir}/usr/bin
	chmod 644 ${pkgdir}/usr/share/applications/electronic-wechat-uos-bin.desktop
	chmod -R 755 ${pkgdir}/opt/electronic-wechat-uos-bin
	chmod a=rx ${pkgdir}/usr/bin/electronic-wechat-uos-bin
	chmod u=rwx ${pkgdir}/usr/bin/electronic-wechat-uos-bin
}
