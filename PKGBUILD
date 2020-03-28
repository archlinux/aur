#Maintainer Robosky <fangyuhao0612@gmail.com>

pkgname=chromeos-gtk-theme-git
_pkgname=chromeos-theme
pkgver=r50.5226421
pkgrel=1
pkgdesc='A Material Design theme for GNOME/GTK based desktop environments.'
arch=('any')
provides=('chromeos-gtk-theme')
url="https://github.com/vinceliuice/${_pkgname}"
license=('GPL3')
optdepends=('gtk-engine-murrine' 'gtk-engines')
makedepends=('git')
source=("git+${url}")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "${srcdir}/${_pkgname}"
	install -m755 -d "${pkgdir}/usr/share/themes"
	./install.sh \
		 --dest "${pkgdir}/usr/share/themes"
}
