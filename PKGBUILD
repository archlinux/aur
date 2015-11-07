# Maintainer: Midov <midov at midov dot com>
pkgname=qownnotes
_pkgname=QOwnNotes
pkgver=0.55
pkgrel=1
pkgdesc="Open source notepad for that works together with the notes application of OwnCloud."
url="http://www.qownnotes.org/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('gcc' 'qt5-base')
makedepends=('git')
#install=$pkgname.install
source=(git+"https://github.com/pbek/QOwnNotes.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  git checkout develop
  cd "${srcdir}/${_pkgname}/src"
  qmake QOwnNotes.pro -r
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "${srcdir}/${_pkgname}/src/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
