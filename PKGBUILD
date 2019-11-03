#Maintainer Robosky <fangyuhao0612@gmail.com>

pkgname=chromeos-gtk-theme-git
_pkgname=ChromeOS-theme
pkgver=1.218bb0a
pkgrel=1
pkgdesc='A Material Design theme for GNOME/GTK based desktop environments.'
arch=('any')
depends=('gtk3' 'gtk-engine-murrine' 'gtk-engines')
license=('GPL3')
url="https://github.com/vinceliuice/${_pkgname}"
source=("git+${url}")
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
		 --dest "${pkgdir}/usr/share/themes"
}
