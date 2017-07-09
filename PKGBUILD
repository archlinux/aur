# Maintainer: joel almeida <aullidolunar at gm_ai1 dot c0m>
# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=Color-UI-theme-project
pkgname=colorui-themes
pkgver=r22.52d038e
pkgrel=2
pkgdesc="Package contains 3 version of gtk3,gtk2,metacity,unity,xfwm4 and openbox theme."
arch=('any')
url="https://github.com/UserContributer/${_pkgname}"
license=('GPL3')
depends=('gnome-themes-standard' 'gtk-engine-murrine' 'gdk-pixbuf2')
source=("${pkgname}::git+https://github.com/UserContributer/Color-UI-theme-project.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname}/Color-UI"
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	find . -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/Color-UI/{}" \;
} 
