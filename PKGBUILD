# Maintainer: MCSeekeri <mcseekeri@outlook.com>
pkgname=48tools
pkgver=4.11.1
pkgrel=1
epoch=
pkgdesc="48工具，提供公演、口袋48直播录源，公演、口袋48录播下载，封面下载，B站直播抓取，B站视频下载，A站直播抓取，A站视频下载，抖音视频下载，视频截取，视频导出gif，视频合并等功能。口袋48的pc版，可以看成员的直播、弹幕和录播。 "
arch=('x86_64')
url="https://github.com/duan602728596/48tools"
license=('GPL3')
depends=('ffmpeg')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}-linux64.zip::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-linux64.zip" "48tools.desktop")
sha512sums=('5888a1c1cffbe8578613da64003df3c52ab490f704d8a86971edb3393db72ed43305ea9c84bd96059d8d2c75468f47eddbc86972c59e11b98dce8ee4bbbbdea7' 'f23eeb875ef8f01dfab6ca1bce97cc1965c6e454b6e199ed71d70026604eafa35767649bd61dc6e2de321ca79e00889012d85a1175350294d9a8860289a29916')

package(){
	cd "${pkgname}-${pkgver}-linux64"
	mkdir -p "${pkgdir}/usr/bin/${pkgname}"
	cp -a ./* "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 ../48tools.desktop "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
