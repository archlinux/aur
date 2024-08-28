# # This is an example PKGBUILD file. Use this as a start to creating your own,
# # and remove these comments. For more information, see 'man PKGBUILD'.
# # NOTE: Please fill out the license field for your package! If it is unknown,
# # then please put 'unknown'.
#
# #Maintainer:'rughinnit'<krpdtmnt@gmail.com>
# pkgname=journal-helper-qt
# pkgver='r1.cca7f25'
# pkgrel=1
# #epoch=
# pkgdesc="Journal in GUI"
# arch=(x86_64)
# url="https://github.com/rughinnit/$pkgname"
# license=('GPL')
# #groups=()
# depends=('libQt6Widgets.so' 'libQt6Gui.so' 'libGLX.so' 'libOpenGL.so' 'libQt6Core.so' 'libstdc++.so' 'libm.so' 'libgcc_s.so' 'libc.so' 'libEGL.so' 'libfontconfig.so' 'libX11.so' 'libglib-2.0.so' 'libQt6DBus.so' 'libxkbcommon.so' 'libpng16.so' 'libharfbuzz.so' 'libmd4c.so' 'libfreetype.so' 'libz.so' 'libGLdispatch.so' 'libicui18n.so' 'libicuuc.so' 'libsystemd.so' 'libdouble-conversion.so' 'libb2.so' 'libpcre2-16.so' 'libzstd.so' 'ld-linux-x86-64.so' 'libexpat.so' 'libxcb.so' 'libpcre2-8.so' 'libdbus-1.so' 'libgraphite2.so' 'libbz2.so' 'libbrotlidec.so' 'libicudata.so' 'libcap.so' 'libgomp.so' 'libXau.so' 'libXdmcp.so' 'libbrotlicommon.so')
# makedepends=("base-devel""make""qmake""git")
# #checkdepends=()
# #optdepends=()
# # provides=()
# #conflicts=()
# #replaces=()
# #backup=()
# #options=()
# #install=
# #changelog=
# source=("$pkgname::https://github.com/rughinnit/journal-helper-qt.git)
# #noextract=()
# sha256sums=("ffa66c5fb0f7bd1d3e0570559620cb8afbf9122a79aa70311e8845731329b5c9")
# #validpgpkeys=()
#
# # prepare() {
# # 	cd "$pkgname-$pkgver"
# # 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# # }
#
# pkgver() {
#   cd "$pkgname"
#   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
# }
#
# build() {
# 	cd "$pkgname"
# 	mkdir build
# 	cd build
# 	qmake6
# 	make
# }
# #/*
# #check() {
# #	cd "$pkgname-$pkgver"
# #	make -k check
# #}
#
# # package() {
# # 	cd "$pkgname-$pkgver"
# # 	make DESTDIR="$pkgdir/" install
# # }*/
#
# package() {
#   cd "$pkgname/build"
#   install -Dm755 journal-helper-qt "$pkgdir/usr/bin/journal-helper-qt"
# }
# }

# Maintainer: 'Roughinnt' <krpdtmnt@gmail.com>
pkgname=journal-helper-qt
pkgver=r6.60f8e57
pkgrel=1
pkgdesc="Journal in GUI"
arch=(x86_64)
url="https://github.com/rughinnit/$pkgname"
license=('GPL')
depends=(qt6-base)
makedepends=(base-devel make qt6-tools git)
source=("$pkgname::git+https://github.com/rughinnit/journal-helper-qt.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$pkgname"
  mkdir -p build
  cd build
  qmake6 ..
  make
}

package() {
  cd "$pkgname/build"
  install -Dm755 journal-helper-qt "$pkgdir/usr/bin/journal-helper-qt"
  cd ..
  install -Dm644 journal-helper-qt.desktop -t "$pkgdir/usr/share/applications"
}
