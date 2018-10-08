# Maintainer: Falk Alexander Seidl <fseidl@gnome.org>

pkgname=gnome-passwordsafe
_gitname=PasswordSafe
pkgver=3.30.1
pkgrel=1
pkgdesc="A password manager for GNOME"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://gitlab.gnome.org/World/PasswordSafe"
depends=('gtk3' 'python-pykeepass' 'python-construct' 'gobject-introspection' 'libhandy')
makedepends=('git' 'meson' 'ninja')
conflicts=('gnome-passwordsafe-git')
source=('https://gitlab.gnome.org/World/PasswordSafe/-/archive/3.30.1/PasswordSafe-3.30.1.tar.gz')
sha256sums=('4cc4b0618a33121fe3e4fa396e71ec00b39f034aa1b6a3e07bce5cf303aa1c91')

build() {
	cd "${srcdir}/${_gitname}-${pkgver}/"
	arch-meson . _build --prefix=/usr
	ninja -C _build
}

package() {
	cd "${srcdir}/${_gitname}-${pkgver}/"
	DESTDIR="${pkgdir}" ninja -C _build install
}

