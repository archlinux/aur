# Maintainer: Deltara <boided420 at gmail dot com>
_pkgname="bigpemu"
pkgname="${_pkgname}-bin"
pkgver=1.19
pkgrel=0
pkgdesc="The World's Prefurred Large Pussycat Emulator"
arch=("x86_64")
url="https://www.richwhitehouse.com"
license=("custom:proprietary")
depends=()
source=(
	"https://www.richwhitehouse.com/jaguar/builds/BigPEmu_Linux64_v${pkgver//./}.tar.gz"
	"${pkgname}.desktop"
)
md5sums=(
	"c6e010f982716145ddec0cd0a7400af2"
	"c3af4065cc25b5a9c976954d868f6924"
)

package() {
	install -d ${pkgdir}/opt/${_pkgname}
	cp -a ${_pkgname}/. ${pkgdir}/opt/${_pkgname}

	chmod 755 ${pkgdir}/opt/${_pkgname}/${_pkgname}
	chmod 777 ${pkgdir}/opt/${_pkgname}/plugins/*

	install -d ${pkgdir}/usr/{bin,share/applications}

	ln -s /opt/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
	install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}
