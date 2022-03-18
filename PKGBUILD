# Maintainer: Matthias Gatto <uso.cosmo.ray at gmail dot com>

pkgname=le-temps-des-escargots-git
pkgver=r165.863137e
pkgrel=1
pkgdesc="Small Game About 1871 Paris Commune"


arch=('any')

url='http://github.com/cosmo-ray/mggj-3'

licence=(LGPL3)

pkgver() {
	 cd "${srcdir}/mggj-3"
	 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

depends=(yirl-git)

source=(git+https://github.com/cosmo-ray/mggj-3)
sha256sums=("SKIP")

build() {
	 cd "${srcdir}/mggj-3"
}

package() {
	 cd "${srcdir}/mggj-3"
	 mkdir -p "$pkgdir/usr/share/le-temps-des-escargots/"
	 cp -rv * "$pkgdir/usr/share/le-temps-des-escargots/"
	 mkdir -p "$pkgdir/usr/bin/"
	 echo "#!/bin/sh" > "$pkgdir/usr/bin/le-temps-des-escargots"
	 echo "yirl-loader --binary-root-path /usr/share/yirl/ -d /usr/share/le-temps-des-escargots/ -L" >> "$pkgdir/usr/bin/le-temps-des-escargots"
	 chmod +x "$pkgdir/usr/bin/le-temps-des-escargots"
	 mkdir -p "$pkgdir/usr/share/applications"
	 cp le-temps-des-escargots.desktop "$pkgdir/usr/share/applications/"
}
