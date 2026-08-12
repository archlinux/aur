# Maintainer: Niko <archpkgs@niko.lgbt>

pkgname=iocaine-nsoe
pkgver=20260802
pkgrel=1
pkgdesc='Iocaine config - Nam Shub of Enki'
arch=('any')
url='https://3.nam-shub-of-enki.iocaine.madhouse-project.org/'
license=('MIT')
depends=('iocaine')
backup=(
	'etc/iocaine/nam-shub-of-enki/init/pkg.roto'
	'etc/iocaine/nam-shub-of-enki/init/nam_shub_of_enki/mod.roto'
	'etc/iocaine/nam-shub-of-enki/init/nam_shub_of_enki/configuration.roto'

	'etc/iocaine/nam-shub-of-enki/main/pkg.roto'
	'etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki/mod.roto'
	'etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki/configuration.roto'
	'etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki/responses.roto'
	'etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki/templates.roto'
	'etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki/verdicts.roto'
	'etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki/classify/mod.roto'
	'etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki/detect/mod.roto'
	'etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki/detect/bad_browser.roto'

	'etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki/tests/mod.roto'
	'etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki/tests/config/mod.roto'
)

# we needn't add a conflicts array because this installs to its own unique directory so this and QMK can coexist safely

source=(
	"${pkgname}-${pkgver}.tar.zst::https://git.madhouse-project.org/api/packages/iocaine/generic/nam-shub-of-enki/latest/nam-shub-of-enki-latest.tar.zst"
)

# unfortunately NSOE currently has no fixed tarball versioning so we must use the current date and skip integrity checks
# see upstream issue 54: https://git.madhouse-project.org/iocaine/nam-shub-of-enki/issues/54
sha256sums=('SKIP')
pkgver() {
  date +%Y%m%d
}

package() {
        cd "${srcdir}/nam-shub-of-enki/"

	install -Dm755 -d "${pkgdir}/etc/iocaine/nam-shub-of-enki/init/nam_shub_of_enki" "${pkgdir}/etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki" "${pkgdir}/etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki/classify" "${pkgdir}/etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki/detect" "${pkgdir}/etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki/tests/config"

	install -Dm644 "init/pkg.roto"					-t "${pkgdir}/etc/iocaine/nam-shub-of-enki/init/"
	install -Dm644 "init/nam_shub_of_enki/mod.roto"			-t "${pkgdir}/etc/iocaine/nam-shub-of-enki/init/nam_shub_of_enki"
	install -Dm644 "init/nam_shub_of_enki/configuration.roto"	-t "${pkgdir}/etc/iocaine/nam-shub-of-enki/init/nam_shub_of_enki"

	install -Dm644 "main/pkg.roto"					-t "${pkgdir}/etc/iocaine/nam-shub-of-enki/main/"
	install -Dm644 "main/nam_shub_of_enki/mod.roto"			-t "${pkgdir}/etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki"
	install -Dm644 "main/nam_shub_of_enki/configuration.roto"	-t "${pkgdir}/etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki"
	install -Dm644 "main/nam_shub_of_enki/responses.roto"		-t "${pkgdir}/etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki"
	install -Dm644 "main/nam_shub_of_enki/templates.roto"		-t "${pkgdir}/etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki"
	install -Dm644 "main/nam_shub_of_enki/verdicts.roto"		-t "${pkgdir}/etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki"
	install -Dm644 "main/nam_shub_of_enki/classify/mod.roto"	-t "${pkgdir}/etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki/classify"
	install -Dm644 "main/nam_shub_of_enki/detect/mod.roto"		-t "${pkgdir}/etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki/detect"
	install -Dm644 "main/nam_shub_of_enki/detect/bad_browser.roto"	-t "${pkgdir}/etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki/detect"

	install -Dm644 "main/nam_shub_of_enki/tests/mod.roto"		-t "${pkgdir}/etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki/tests"
	install -Dm644 "main/nam_shub_of_enki/tests/config/mod.roto"	-t "${pkgdir}/etc/iocaine/nam-shub-of-enki/main/nam_shub_of_enki/tests/config"
}
