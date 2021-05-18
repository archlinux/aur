#Maintainer: allencch <allencch at hotmail dot com>
pkgname=amd
pkgver=1.0.0
pkgrel=4
pkgdesc="An Automated Motif Discovery Tool Using Stepwise Refinement of Gapped Consensuses"
arch=('i686' 'x86_64')
url="https://www.plosone.org/article/info%3Adoi%2F10.1371%2Fjournal.pone.0024576"
license=('custom')
makedepends=("unrar")
source=("journal.pone.0024576.s004.rar::https://www.plosone.org/article/fetchSingleRepresentation.action?uri=info:doi/10.1371/journal.pone.0024576.s004")
md5sums=('18eb715f0fb1f8bbfc1b1c359f04e77a')
noextract=("journal.pone.0024576.s004.rar")
options=(!strip !buildflags)

build() {
	#mv journal.pone.0024576.s004 journal.pone.0024576.s004.rar
	unrar x -y "journal.pone.0024576.s004.rar"
	cd "${srcdir}/source"
	make
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cd "${srcdir}/source"
	install -m755 AMD "${pkgdir}/usr/bin"
}
