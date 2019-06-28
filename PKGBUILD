# Maintainer: Robosky <fangyuhao0612@gmail.com>

pkgname=tela-icon-theme-git
_gitname=Tela-icon-theme
pkgdesc="A flat colorful Design icon theme."
pkgver=125.a8779878
pkgrel=1
arch=('any')
url="https://github.com/vinceliuice/${_gitname}"
license=('GPL3')
source=("git+${url}.git")
sha256sums=('SKIP')
options=('!strip')
makedepends=('git')

pkgver() {
    cd "${srcdir}/${_gitname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
	cd "${srcdir}/${_gitname}"
	install -dm755 "${pkgdir}/"usr/share/icons
	sed -i '/gtk-update-icon-cache/d' install.sh
	./install.sh \
		-a \
		-d "${pkgdir}"/usr/share/icons
}
	
