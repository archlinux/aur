# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>
# Maintainer: Mahor Foruzesh <mahorforuzesh at protonmail dot com>

pkgname=tachidesk
pkgver=0.2.5.r256
pkgrel=1
pkgdesc="A free and open source manga reader that runs extensions built for Tachiyomi"
arch=('any')
url="https://github.com/Suwayomi/Tachidesk"
_url="https://api.github.com/repos/Suwayomi/Tachidesk/releases/latest"
license=('MPL2')
depends=("java-runtime")
provides=("tachidesk")
source=(
	"${pkgname}-${pkgver}.jar::$(curl -s ${_url} | grep "browser_download_url.*jar" | cut -d\" -f4)"
	"${pkgname}.sh"
)
md5sums=('4c9df61451e7644c04db7bde22e7dcc2'
         '196d4e69879d3b01f73672c812c0f20c')

pkgver() {
	curl -s ${_url}  | grep -m1 "Tachidesk.*jar" -o | sed -n -e's/Tachidesk-v\|.jar//g;s/-/./gp'
}

package() {
	install -Dm755 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
	install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}


