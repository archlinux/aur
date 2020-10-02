# Maintainer: aksr <aksr at t-com dot me>
pkgname=gsfonts-type1-git
pkgver=r11.91edd6e
pkgrel=2
pkgdesc="URW+ Postscript core35 Type 1 Format fonts"
arch=('any')
url="http://git.ghostscript.com/?p=urw-core35-fonts.git;a=summary"
license=('AGPL3')
depends=('fontconfig')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+git://git.ghostscript.com/urw-core35-fonts.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir"/usr/share/fonts/Type1
	#install -m644 *.{pfb,pfm,afm,t1} "$pkgdir"/usr/share/fonts/Type1
	install -m644 *.{afm,t1} "$pkgdir"/usr/share/fonts/Type1
}
