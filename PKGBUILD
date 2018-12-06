#Maintainer Robosky <fangyuhao0612@gmail.com>
pkgname=toffee-gtk-theme-git
_gitname=Toffee-gtk-theme
pkgver=44.a349c06
pkgrel=1
pkgdesc='A flat Material Design theme for GTK 3, GTK 2 and Gnome-Shell which supports GTK 3 and GTK 2 based desktop environments like Gnome, Budgie, etc.'
arch=('any')
url='https://github.com/vinceliuice/Toffee-gtk-theme'
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
optdepends=('glib2: to use the GDM theme')
license=('GPL2')
source=("git+https://github.com/vinceliuice/${_gitname}"
	"${pkgname}.install")
install="${pkgname}.install"
md5sums=('SKIP'
	'SKIP')


pkgver() {
    cd "${srcdir}/${_gitname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
	cd "${srcdir}/${_gitname}"
	install -m755 -d "${pkgdir}/usr/share/themes"
	./install.sh --gdm \
		--dest "${pkgdir}/usr/share/themes"
}

