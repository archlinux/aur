# Based on plymouth-theme-arch-darwin's PKGBUILD

# BatarongOS Plymouth theme
# Maintainer: PracticeMedicine <practicemedicine3@gmail.com>
# Maintainer: Toilet Man <dingledingus2023@outlook.com>
pkgname=plymouth-batarong-theme
_themename=batarong
# We're submitting this tomorrow set the version string to 1.0
# pkgver=0.9
pkgver=1.0
pkgrel=1
pkgdesc="Plymouth theme for BatarongOS"
arch=("any")
url="https://github.com/batarongOS/plymouth-batarong-theme"
license=('GPL')
depends=(plymouth)
makedepends=(git)
source=("git+https://github.com/batarongOS/plymouth-batarong-theme.git")
md5sums=("SKIP")

package() {
	cd "${srcdir}/${pkgname}"
  	_themedir="${pkgdir}/usr/share/plymouth/themes/$_themename"

  	for N in "${_themename}.plymouth" *.png "${_themename}.script"; do
    	install -Dm644 $N "${_themedir}/$N"
  	done
	
	install -Dm644 LICENSE "${pkgdir}/usr/share/license/$pkgname/LICENSE"

	echo "To apply this theme:"
	echo "	You must run 'plymouth-set-default-theme batarong' as root (sudo)"
}


