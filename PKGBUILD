# Maintainer: Stephen Ogilvy <hypernormalisation at tuta dot io>
pkgname=pomeron-gtk-theme-git
pkgver=20210104.05060ea
pkgrel=1
pkgdesc="Dark, red GTK theme for GNOME desktops"
arch=('any')
url="https://github.com/hypernormalisation/Pomeron-GTK"
license=('GPL')
depends=('gtk-engine-murrine' 'gtk-engines' 'gtk3')
makedepends=('git')
optdepends=('tela-circle-icon-theme-git: pairs well with this icon theme')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("${pkgname%-git}::git+https://github.com/hypernormalisation/Pomeron-GTK")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/pomeron-gtk-theme"
    local date=$(date --date "$(git show -s --format=%ci)" +%Y%m%d)
    local commit=$(git rev-parse --short HEAD)
    echo $date.$commit	
}

package() {
	DESTDIR="$pkgdir/usr/share/themes"
	mkdir -p "$DESTDIR"
	cd "$srcdir"
	cp -r pomeron-gtk-theme "$DESTDIR/"
}
