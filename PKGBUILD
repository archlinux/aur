# Contributor: erm67
# Maintainer: Pablo Lezaeta <prflr88@gmail.com>

pkgname=micropolis-java
_rpkgname=micropolisj
pkgver=1.6
pkgrel=2
pkgdesc="Micropolis Unix version [SimCity 1] rewrited in Java"
arch=("any")
url="https://github.com/SimHacker/micropolis"
license=("custom:GPL3")
depends=("java-runtime>=7")
# Upstream in GitHub not have tarballs, and the repo is a mess, help?
source=("http://micropolis.googlecode.com/files/${_rpkgname}-${pkgver}.zip"
#	"git+https://github.com/jason17055/micropolis-java.git"
	"LICENSE"
	"micropolis-java.sh"
	"micropolis-java.desktop")



package(){
	cd "${srcdir}"

	install -Dm677 "${srcdir}/${_rpkgname}.jar" \
		"${pkgdir}/usr/share/micropolis-java/${_rpkgname}.java"
	install -Dm677 "${srcdir}/COPYING" \
		"${pkgdir}/usr/share/doc/${pkgname}/COPYING"
	cp "${srcdir}/LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
	install -Dm677 "${srcdir}/README" \
		"${pkgdir}/usr/share/doc/${pkgname}/README"
	install -Dm677 "${srcdir}/${_rpkgname}-icon.png" \
		"${pkgdir}/usr/share/pixmaps/${_rpkgname}.png"
	install -Dm677 "${srcdir}/micropolis-java.sh" \
		"${pkgdir}/usr/bin/micropolis-java"
	install -Dm677 "${srcdir}/micropolis-java.desktop" \
		"${pkgdir}/usr/share/applications/micropolis-java.desktop"
}

md5sums=('814be8cc8be6e15c190b4023772540ae'
         'b95118d1c60c6649ab9403cbaa4abb86'
         '3a3175eff542ff8c08483e2b41b45529'
         '5d0667a3049111b4e7e9f07f1992bc01')
