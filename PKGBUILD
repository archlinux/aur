# Maintainer: Derek Taylor (DistroTube) <derek@distrotube.com>
pkgname=dwm-distrotube
pkgver=6.2
pkgrel=1
pkgdesc="A heavily-patched and customized build of dwm from DistroTube."
arch=(x86_64 i686)
url="https://gitlab.com/dwt1/dwm-distrotube.git"
license=('MIT')
groups=()
depends=(libx11 libxinerama libxft freetype2 st dmenu)
makedepends=(make)
checkdepends=()
optdepends=()
provides=(dwm)
conflicts=(dwm)
replaces=()
backup=()
options=()
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
  cd "$pkgname"
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11 FREETYPEINC=/usr/include/freetype2
}

package() {
  cd "$pkgname"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}