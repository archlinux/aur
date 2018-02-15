# Maintainer: Pablo Moyano (p4block)
pkgname=net2plan
pkgver=0.5.3
_pkgver=0.5.3
_pkgzip=0.5.3
pkgrel=1
pkgdesc='Java tool for planning, optimizing and evaluating communication networks.'
arch=('x86_64')
url='https://github.com/girtel/Net2Plan'
license=('GPL3')
depends=('glpk' 'coin-or-ipopt' 'java-environment')
source=("https://github.com/girtel/Net2Plan/releases/download/${_pkgver}/net2plan-${_pkgzip}.zip")
md5sums=('5bec464c40f3f31829bb8a55189a721f')

package() {
	mkdir $pkgdir/opt
	cp -r "${srcdir}/Net2Plan-${_pkgzip}/"	"${pkgdir}/opt/net2plan"
	
	install -Dm755 ../net2plan.sh		"${pkgdir}/usr/bin/net2plan"
	install -Dm755 ../net2plan-cli.sh	"${pkgdir}/usr/bin/net2plan-cli"

	install -Dm644 ../net2plan.desktop	"${pkgdir}/usr/share/applications/net2plan.desktop"	
	install -Dm644 ../net2plan.png		"${pkgdir}/usr/share/pixmaps/net2plan.png"
}
