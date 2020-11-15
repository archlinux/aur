pkgname=cbr2pdf-git
pkgver=1.r18.87ca205
pkgrel=1
pkgdesc="cbr2pdf is a bash script will convert all .cbr and .cbz files to .pdf"
url="https://gitlab.com/airatb1508/cbr2pdf"
arch=('any')
license=('GPL')
depends=('img2pdf' 'p7zip')
makedepends=('git')
source=("git+https://gitlab.com/airatb1508/cbr2pdf.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}"
}

package() {
	cd cbr2pdf
	mkdir -p ${pkgdir}/usr/bin
	mv cbr2pdf.sh ${pkgdir}/usr/bin/cbr2pdf
	chmod +x ${pkgdir}/usr/bin/cbr2pdf
}
