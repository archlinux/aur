#Maintainer Robosky <fangyuhao0612@gmail.com>
pkgname=mojave-gtk-theme-git
_pkgname=Mojave-gtk-theme
pkgver=215.7a621f3
pkgrel=1
pkgdesc='A Mac OSX like theme for GTK 3, GTK 2 and Gnome-Shell which supports GTK 3 and GTK 2 based desktop environments like Gnome, Pantheon, XFCE, Mate, etc.'
arch=('any')
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
license=('GPL3')
url='https://github.com/vinceliuice/Mojave-gtk-theme'
source=('git+https://github.com/vinceliuice/Mojave-gtk-theme.git')
md5sums=('SKIP')
makedepends=('git')
options=('!strip')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -m755 -d "${pkgdir}/usr/share/themes"
	./install.sh \
		 --dest "${pkgdir}/usr/share/themes" \
		 --icon arch 
}
