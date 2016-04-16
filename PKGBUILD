# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Contributor: martinjlowm <martin {at} martinjlowm {dot} dk>

pkgname=zuki-themes-git
pkgver=r81.f78c14d
pkgrel=1
pkgdesc="A selection of themes for GTK3, gnome-shell and more."
arch=('any')
url="https://github.com/lassekongo83/zuki-themes"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines')
conflicts=('zukitwo-themes')
optdepends=('gnome-themes-standard: Required for the GTK3 theme'
            'ttf-droid: Font family for the Gnome Shell theme')
install='firefox-theme.install'

source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver() {
   	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  	cd "${pkgname}"
  	find */ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
