# Maintainer: jswagner <jason-at-jason;s.wagner*dot,com>
_pkgname=DiscImageCreator
pkgname=discimagecreator-bin
url="https://github.com/saramibreak/DiscImageCreator"
arch=('x86_64')
pkgdesc="DiscImageCreator, offical release with supplemental binaries and text files for full functionality."
provides=('discimagecreator')
conflicts=('discimagecreator')
pkgver=20230413
pkgrel=1
license=('Apache')
# Developer attaches links to the compiled builds in release notes so this entire URL must be replaced with every new build.
source=("https://github.com/saramibreak/DiscImageCreator/files/11222269/DiscImageCreator_20230413.tar.gz")
# source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('099cb574cacf7af444a938051248a7ac4e9dd6f5bd327487c879d950a2e64243')

package() {
	# install binaries
	mkdir -p ${pkgdir}/usr/bin
	install -Dm 755 ${srcdir}/${_pkgname}/DiscImageCreator_linux.out ${pkgdir}/usr/bin/DiscImageCreator
	install -Dm 755 ${srcdir}/${_pkgname}/DVDAuth_linux.out ${pkgdir}/usr/bin/DVDAuth_linux.out
	install -Dm 755 ${srcdir}/${_pkgname}/EccEdc_linux.out ${pkgdir}/usr/bin/EccEdc_linux.out

	# install supplemental data files
	mkdir -p ${pkgdir}/usr/lib/${_pkgname}
	install -Dm 644 ${srcdir}/${_pkgname}/C2ErrorProtect.txt ${pkgdir}/usr/local/share/${_pkgname}/C2ErrorProtect.txt
	install -Dm 644 ${srcdir}/${_pkgname}/default.dat ${pkgdir}/usr/local/share/${_pkgname}/default.dat
	install -Dm 644 ${srcdir}/${_pkgname}/driveOffset.txt ${pkgdir}/usr/local/share/${_pkgname}/driveOffset.txt
	install -Dm 644 ${srcdir}/${_pkgname}/ReadErrorProtect.txt ${pkgdir}/usr/local/share/${_pkgname}/ReadErrorProtect.txt

	# install documentation
	install -Dm 644 ${srcdir}/${_pkgname}/Doc/ChangeLog.txt ${pkgdir}/usr/local/share/doc/${_pkgname}/ChangeLog.txt
	install -Dm 644 "${srcdir}/${_pkgname}/Doc/Firmware&Tool.md" "${pkgdir}/usr/local/share/doc/${_pkgname}/Firmware&Tool.md"
	install -Dm 644 ${srcdir}/${_pkgname}/Doc/KnownIssue.txt ${pkgdir}/usr/local/share/doc/${_pkgname}/KnownIssue.txt
	install -Dm 644 ${srcdir}/${_pkgname}/Doc/Reference.md ${pkgdir}/usr/local/share/doc/${_pkgname}/Reference.md
	install -Dm 644 ${srcdir}/${_pkgname}/Doc/TestedDrive.txt ${pkgdir}/usr/local/share/doc/${_pkgname}/TestedDrive.txt
	install -Dm 644 ${srcdir}/${_pkgname}/Doc/Todo.txt ${pkgdir}/usr/local/share/doc/${_pkgname}/Todo.txt
	install -Dm 644 ${srcdir}/${_pkgname}/README.md ${pkgdir}/usr/local/share/doc/${_pkgname}/README.md

	# install license
	install -Dm 644 ${srcdir}/${_pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE

}
