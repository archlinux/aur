#Maintainer Robosky <fangyuhao0612@gmail.com>
pkgname=toffee-gtk-theme-git
_gitname=Toffee-gtk-theme
pkgver=40.35272de
pkgrel=1
pkgdesc='A flat Material Design theme for GTK 3, GTK 2 and Gnome-Shell which supports GTK 3 and GTK 2 based desktop environments like Gnome, Budgie, etc.'
arch=('any')
url='https://github.com/vinceliuice/Toffee-gtk-theme'
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
license=('GPL3')
source=("git+https://github.com/vinceliuice/${_gitname}")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
	cd "${srcdir}/${_gitname}"
	install -m755 -d "${pkgdir}/usr/share/themes"
	./install.sh --gdm --dest "${pkgdir}/usr/share/themes"
}

