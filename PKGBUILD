# Maintainer: Aria Moradi <aria.moradi007 at gmail dot com>
# Maintainer: Mahor Foruzesh <mahorforuzesh at protonmail dot com>

pkgname=tachidesk
pkgver=0.2.5.r256
pkgrel=1
pkgdesc="A free and open source manga reader that runs extensions built for Tachiyomi"
arch=('any')
url="https://github.com/AriaMoradi/Tachidesk"
license=('MPL2')
depends=("java-runtime")
provides=("tachidesk")
source=(
	"${pkgname}-${pkgver}.jar::$(curl -s https://api.github.com/repos/AriaMoradi/Tachidesk/releases/latest | grep "browser_download_url.*jar" | cut -d\" -f4)"
	"${pkgname}.sh"
)
md5sums=('SKIP' 'SKIP')

pkgver() {
	curl -s https://api.github.com/repos/AriaMoradi/Tachidesk/releases/latest | grep -m1 "Tachidesk.*jar" -o | sed -n -e's/Tachidesk-v\|.jar//g;s/-/./gp'
}

package() {
	install -Dm755 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
	install -Dm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}

