#Maintainer: Cory Swauger <ensayia@gmail.com>

_pkgname=Meliora
pkgname=meliora-openbox-themes
pkgver=0.0
pkgrel=1
pkgdesc="$_pkgname Openbox Themes"
arch=('any')
license=('ZLIB')
url="https://bitbucket.org/Ensayia/meliora-openbox-themes"
depends=('openbox')
makedepends=('git')
source=('meliora-openbox-themes::git+https://bitbucket.org/Ensayia/meliora-openbox-themes.git#branch=master')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/Lila-hd-icon-theme"
	git describe --always | sed 's|-|.|g'
}

package() {
	install -d -m755 "$pkgdir/usr/share/themes"
	cd meliora-openbox-themes
	cp -r * "$pkgdir/usr/share/themes"
}
