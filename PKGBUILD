# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname=rofi-file-browser-extended-patched
_pkgname=rofi-file-browser-extended
pkgver=5.0.r2.258f02e
pkgrel=1
epoch=
pkgdesc="Use rofi to quickly open files."
arch=(x86_64)
url="https://github.com/DemonKingSwarn/${_pkgname}"
license=('MIT')
groups=()
depends=()
makedepends=(git cmake make rofi)
checkdepends=()
optdepends=()
provides=(rofi-file-browser-extended)
conflicts=(rofi-file-browser-extended-git)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
    printf "5.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${srcdir}/${_pkgname}
  cmake .
  make
}

package() {
   cd "${srcdir}/${_pkgname}" 
   make DESTDIR="${pkgdir}" PREFIX=/usr install
   install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

