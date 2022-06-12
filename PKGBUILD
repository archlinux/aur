# Maintainer: Lucas Rooyakkers <lucas rooyakkers @ pm me>
pkgname=sws-bin
pkgver=2.12.1.3
pkgrel=2
pkgdesc="A collection of features that seamlessly integrate into REAPER"
arch=('x86_64')
url="https://www.sws-extension.org/"
license=('MIT')
depends=('reaper' 'taglib')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("https://sws-extension.org/download/featured/sws-${pkgver}-Linux-x86_64.tar.xz")
sha256sums=('520f5781d6dd6462a51561dfa4a6a16422b606ccdedd6c991e3b93287b2b2db7')

package() {
	mkdir -p "${pkgdir}/opt/REAPER/UserPlugins/"
	cp -v "${srcdir}/UserPlugins/reaper_sws-x86_64.so" "${pkgdir}/opt/REAPER/UserPlugins/"

	mkdir -p "${pkgdir}/opt/REAPER/Scripts/"
	cp -v "${srcdir}/Scripts/sws_python64.py" "${pkgdir}/opt/REAPER/Scripts/"

	cp -rv "${srcdir}/Grooves/" "${pkgdir}/opt/REAPER/Grooves/"
}
