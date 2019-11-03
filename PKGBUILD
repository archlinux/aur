# Maintainer: Dimitris Kiziridis <ragouel@outlook.com>

pkgname=('ex-impression-icon-theme-git')
pkgver=1.0.1
pkgrel=1
pkgdesc="This icon theme got inspired on Mac OS icons and mimics those for the Linux OS."
arch=('any')
url="https://github.com/balasakthi88/EX-Impression"
license=('GPL v3')
makedepends=('git')
source=("git+$url")
provides=("${pkgname%-*}" "${pkgname}")
conflicts=("${pkgname%-*}" "${pkgname}")
options=('!strip')
md5sums=('SKIP')

build() {
	cd "$srcdir"/EX-Impression
 	rm *.md
  rm LICENSE
  rm categories
}

package() {
	msg2 "Installing ${pkgname%-*}...";
	cd "$srcdir"
	install -dm 755 "${pkgdir}"/usr/share/icons/;
	cp -drf --no-preserve='ownership' . "${pkgdir}"/usr/share/icons/;
}
