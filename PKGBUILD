# Maintainer: Midov <midov at midov dot pl>
pkgname=qownnotes
_pkgname=QOwnNotes
_tag="linux-b770-175303"
pkgver=0.78
pkgrel=1
pkgdesc="Open source notepad for that works together with the notes application of OwnCloud."
url="http://www.qownnotes.org/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('gcc' 'qt5-base' 'qt5-svg' 'qt5-script')
makedepends=('git')
#install=$pkgname.install
source=("git://github.com/pbek/QOwnNotes.git#tag=$_tag"
	qownnotes.desktop)
md5sums=('SKIP'
	'dd75c043efe26395e0a12be809806f70')

build() {
  cd "${srcdir}/${_pkgname}"
  cd "${srcdir}/${_pkgname}/src"
  qmake QOwnNotes.pro -r
  make
}


package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "${srcdir}/${_pkgname}/src/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/qownnotes.desktop" "${pkgdir}/usr/share/applications/qownnotes.desktop"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
