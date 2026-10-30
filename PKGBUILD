# Maintainer: waschtl <tyrolyean@tyrolyean.net>

_pkgname=icy_draw
pkgname=${_pkgname}-bin
pkgver=0.6.2
pkgrel=1
groups=("icy_tools-bin")
provides=("icy_draw")
pkgdesc="IcyDraw is a full features ansi drawing tool doing things a bit different than other tools."
arch=('x86_64')
url="https://github.com/mkrueger/icy_tools"
license=('Apache-2.0')
optdepends=()
source=("$url/releases/download/IcyDraw$pkgver/icy_draw_linux_$pkgver.zip")
sha512sums=('9947a7af929ca4f71f26b168f660670e1c8216a37cd56e7d6400dbfdc4ccd7329e89f6ad565e03677fa1e99cfc5d66af88d5bba53ed197b23ef0de2e7b3b1200')
b2sums=('0d25760a9a0f2510dc8c88076e799bff017d3acf95dae1f95ca59c48bdb52138a69d4f30cc32a94b5d7e646fe0728fa5c5cbf47792aac40dfda46295760a2784')

prepare() {
	cd "${srcdir}/"
	ar -x "icy_draw.deb"
	bsdtar -xvf data.tar.xz
}

package() {
  cd "${srcdir}/"
  install -DTm0755 "$srcdir/usr/share/doc/icy-draw/copyright" "$pkgdir/usr/share/doc/icy-draw/copyright"
  install -DTm0755 "$srcdir/usr/share/applications/icy_draw.desktop" "$pkgdir/usr/share/applications/icy_draw.desktop"
  install -DTm0755 "$srcdir/usr/share/icons/hicolor/128x128/apps/icy_draw.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/icy_draw.png"
  install -DTm0755 "$srcdir/usr/share/icons/hicolor/256x256/apps/icy_draw.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/icy_draw.png"
  install -DTm0755 "$srcdir/usr/bin/icy_draw" "$pkgdir/usr/bin/icy_draw"
}
