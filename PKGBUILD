# Maintainer: Daniel Wallace <daniel.wallace at gatech dot edu> <- In AUR this have 4690 votes, but was a troll and now fixed
# Maintainer: Pablo Lezaeta <prflr88 @ gmail . com> (Pony Provider)

pkgname=ponysay-git
_pkgname=ponysay
pkgver=3.0.2.r2317
pkgrel=1
pkgdesc="Cowsay reimplementation for ponies."
arch=("any")
url="https://github.com/erkin/ponysay"
license=("GPL2" "FDL")
depends=("python3" "coreutils")
provides=("ponysay")
conflicts=("ponysay" "ponysay-git")
optdepends=("util-say:  Improved TTY support utilising KMS and support for PNG files")
makedepends=("git" "texinfo")
screenshot="http://i.imgur.com/xOJbE.png"
source=("$_pkgname::git+https://github.com/erkin/ponysay.git")
md5sums=("SKIP")

pkgver(){
	cd "${_pkgname}"
	echo "$(git describe --always --abbrev=0 ).r$(git rev-list --count HEAD | sed 's/-/./g' )"
}

package() {
	cd "${srcdir}/${_pkgname}"
	python3  ./setup.py --prefix=/usr \
			--everything \
			--with-pdf-manual=/usr/share/doc/"${_pkgname}" \
			--without-pdf-manual-compression \
			--dest-dir="${pkgdir}" \
			--bin-dir=/usr/bin --freedom=partial install
}

# vim:set ts=2 sw=2 et:
