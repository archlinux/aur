# Maintainer: Pablo Moyano (p4block)
pkgname=net2plan
pkgver=0.5.0
pkgrel=1
pkgdesc='Java tool for planning, optimizing and evaluating communication networks.'
arch=('x86_64')
url='https://github.com/girtel/Net2Plan'
license=('GPL3')
depends=('glpk' 'coin-or-ipopt' 'java-environment')
source=("https://github.com/girtel/Net2Plan/releases/download/${pkgver}/net2plan-${pkgver}.zip")
md5sums=('75c1156bfb5b996f50f3b2a48953b6b3')

package() {
	mkdir $pkgdir/opt
	cp -r "${srcdir}/net2plan-${pkgver}/"	"${pkgdir}/opt/net2plan"
	
	install -Dm755 ../net2plan.sh		"${pkgdir}/usr/bin/net2plan"
	install -Dm755 ../net2plan-cli.sh	"${pkgdir}/usr/bin/net2plan-cli"

	install -Dm644 ../net2plan.desktop	"${pkgdir}/usr/share/applications/net2plan.desktop"	
	install -Dm644 ../net2plan.png		"${pkgdir}/usr/share/pixmaps/net2plan.png"
}
