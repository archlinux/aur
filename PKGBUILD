pkgname=audela-bin
_pkgname=audela
pkgver=4.2.0
pkgrel=2
pkgdesc="AudeLA is a TCL extension aimed at providing amateur astronomers with image processing, telescope controling, ccd camera driving, and various astronomical algorithms"
arch=(x86_64)
url="https://sourceforge.net/projects/audela/"
license=(GPL)
depends=('tcl' 'tk')
makedepends=()
source=("https://sourceforge.net/projects/${_pkgname}/files/${_pkgname}/current-development/${_pkgname}-${pkgver}b1-amd64.deb")
sha256sums=('cfdfee2ec29fff76a74a8f80a36bc0e513cf2cf6da0ad67809f0c33c040407cc')


package() {
	cd "${srcdir}"
	tar -I zstd -xvf data.tar.zst

	## mkinfo "Preparing needed directories ..."
	mkdir -pv "${pkgdir}/opt/${_pkgname}"
	
	## mkinfo "Install binaries ..."
	cp -rv "${srcdir}/usr/" "${pkgdir}/opt/${_pkgname}"
}

