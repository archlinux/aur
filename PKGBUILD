# Maintainer: Evan Tatarka <evan @ tatarka . me>
# Contributor: Daniel Wallace <daniel.wallace at gatech dot edu>
# Once In AUR3 this package used to have 4690 votes, but was a troll and now fixed
# Contributor: Pablo Lezaeta <prflr88 @ gmail . com> (Pony Provider)

pkgname=ponysay-git
_pkgname=ponysay
pkgver=3.0.3+25
pkgrel=1
pkgdesc="Cowsay reimplementation for ponies."
arch=("any")
url="https://github.com/erkin/ponysay"
license=("GPL3" "FDL")
depends=("python3" "coreutils")
provides=("ponysay")
conflicts=("ponysay")
optdepends=("util-say:  Improved TTY support utilising KMS and support for PNG files")
makedepends=("git" "texinfo")
screenshot="http://i.imgur.com/xOJbE.png"
source=("$_pkgname::git+https://github.com/erkin/ponysay.git")
md5sums=("SKIP")

pkgver(){
	cd "${_pkgname}"
	echo "$(git describe --long | sed -r 's/-([0-9,a-g,A-G]{7}.*)//' | sed 's/-/+/' )"
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
