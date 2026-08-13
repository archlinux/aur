# Maintainer: Niko <arch-pkgs@niko.lgbt>

pkgname=iocaine-qmk
pkgver=3.5.0
pkgrel=1
pkgdesc='Iocaine config - Quickly Mark and Kill'
arch=('any')
url='https://iocaine.madhouse-project.org/'
license=('MIT')
depends=('git')
#depends=('iocaine')
backup=(
	'etc/iocaine/quickly-mark-and-kill/init/pkg.roto'
	'etc/iocaine/quickly-mark-and-kill/main/pkg.roto'
	'etc/iocaine/quickly-mark-and-kill/README.md'
)

# we needn't add a conflicts array because this installs to its own unique directory so this and NSOE can coexist safely

source=("iocaine::git+https://git.madhouse-project.org/iocaine/iocaine.git#tag=iocaine-${pkgver}")
sha256sums=('SKIP')

package() {
        cd "${srcdir}/iocaine/iocaine-powder/embeds/defaults/"

	install -Dm755 -d "${pkgdir}/etc/iocaine/quickly-mark-and-kill/init/" "${pkgdir}/etc/iocaine/quickly-mark-and-kill/main/"

	install -Dm644 "../qmk-dashboard.json"	-t "${pkgdir}/etc/iocaine/quickly-mark-and-kill/"
	install -Dm644 "README.md"		-t "${pkgdir}/etc/iocaine/quickly-mark-and-kill/"
	install -Dm644 "roto/init/pkg.roto"	-t "${pkgdir}/etc/iocaine/quickly-mark-and-kill/init/"
	install -Dm644 "roto/main/pkg.roto"	-t "${pkgdir}/etc/iocaine/quickly-mark-and-kill/main/"
}
