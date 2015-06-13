# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=diffmerge
pkgver=4.2.0.697
pkgrel=1
pkgdesc="SourceGear DiffMerge is an application to visually compare and merge files."
url="http://www.sourcegear.com/diffmerge/"
arch=('i686' 'x86_64')
license=('custom')
depends=('gtk2' 'libpng15' 'curl')
source_i686+=("http://download-us.sourcegear.com/DiffMerge/4.2.0/${pkgname}-${pkgver}.stable-1.i686.rpm")
source_x86_64+=("http://download-us.sourcegear.com/DiffMerge/4.2.0/${pkgname}-${pkgver}.stable-1.x86_64.rpm")
md5sums_i686=('461659a788785e4b1979ba81ee4ed8f3')
md5sums_x86_64=('230a8ce57ae5ef88f79113ceb39b839f')

package() {
	cd "${srcdir}"
	# app
	install -Dm755 usr/bin/diffmerge ${pkgdir}/usr/bin/diffmerge
	install -Dm644 usr/share/pixmaps/sourcegearcom-diffmerge.png ${pkgdir}/usr/share/pixmaps/sourcegearcom-diffmerge.png
	install -Dm644 usr/share/man/man1/diffmerge.1.gz ${pkgdir}/usr/share/man/man1/diffmerge.1.gz
	install -Dm644 usr/share/applications/sourcegear.com-diffmerge.desktop ${pkgdir}/usr/share/applications/diffmerge.desktop
	# doc
	install -Dm644 usr/share/doc/diffmerge-${pkgver}.stable/DiffMergeManual.pdf ${pkgdir}/usr/share/doc/${pkgname}/DiffMergeManual.pdf
	# license
	install -Dm644 usr/share/doc/diffmerge-${pkgver}.stable/copyright ${pkgdir}/usr/share/licenses/${pkgname}/copyright
	install -Dm644 usr/share/doc/diffmerge-${pkgver}.stable/Readme.txt ${pkgdir}/usr/share/licenses/${pkgname}/Readme.txt
}
