# Maintainer: 31337h4ck3r at gmail dot com
# Contributor: tinywrkb <tinywrkb@gmail.com>
# Contributor: theferdi265 at gmail dot com
#
# Original package: gtk-theme-numix-solarized

pkgname=gtk3-theme-numix-solarized
_pkgname=gtk-theme-numix-solarized
pkgver=20210831
pkgrel=1
pkgdesc="Solarized versions of GTK3 theme, compatible with GTK 3.20"
arch=('any')
url="https://github.com/Ferdi265/numix-solarized-gtk-theme"
license=('GPL3')
optdepends=('gtk-engine-murrine')
conflicts=('gtk-theme-numix-solarized')
source=("https://github.com/Ferdi265/numix-solarized-gtk-theme/releases/download/$pkgver/NumixSolarized-$pkgver.tar.gz")
sha256sums=('25f2e3bc899ed15461b6e9bf30566ecd5ebc742ebac93f0416e42c2b020559e6')

prepare() {
	rm -fr $(find NumixSolarized/ -type d -regex '.*metacity-1\|.*openbox-3\|.*unity\|.*xfce-notify-4.0\|.*xfwm4')
}

package(){
	cd "$srcdir/NumixSolarized"
	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
