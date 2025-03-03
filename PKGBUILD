# Maintainer: MCSeekeri <mcseekeri@outlook.com>
pkgname=48tools
pkgver=4.16.1
pkgrel=1
epoch=
pkgdesc="48工具，提供公演、口袋48直播录源，公演、口袋48录播下载，封面下载，B站直播抓取，B站视频下载，A站直播抓取，A站视频下载，抖音视频下载，视频截取，视频导出gif，视频合并等功能。口袋48的pc版，可以看成员的直播、弹幕和录播。 "
arch=('x86_64')
url="https://github.com/duan602728596/48tools"
license=('GPL3')
depends=('ffmpeg')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}-linux64.zip::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux64.zip" "48tools.desktop")
sha512sums=('f94e1e6efff70f23b7ce3f81077540f1e9117fc7612ebd95bf543db9b2f4828981cad7dd7f98a5f5af7b00ee3c9ee3e211e4fdcd71e1afd9f83f2980bfe66c08' 'f23eeb875ef8f01dfab6ca1bce97cc1965c6e454b6e199ed71d70026604eafa35767649bd61dc6e2de321ca79e00889012d85a1175350294d9a8860289a29916')

package(){
	cd "${pkgname}-${pkgver}-linux64"
	mkdir -p "${pkgdir}/usr/bin/${pkgname}"
	cp -a ./* "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 ../48tools.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
