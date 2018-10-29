# Maintainer: Falk Alexander Seidl <fseidl@gnome.org>

pkgname=gnome-passwordsafe
_gitname=PasswordSafe
pkgver=3.30.2
pkgrel=1
pkgdesc="A password manager for GNOME"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://gitlab.gnome.org/World/PasswordSafe"
depends=('gtk3' 'python-pykeepass' 'python-construct' 'gobject-introspection' 'libhandy')
makedepends=('git' 'meson' 'ninja')
conflicts=('gnome-passwordsafe-git')
source=('https://gitlab.gnome.org/World/PasswordSafe/-/archive/3.30.2/PasswordSafe-3.30.2.tar.gz')
sha256sums=('ab25b4c0c85ba02d26d04c8f508bb6efad2c1b31ed589b72ce3452ac1f0c0d4d')

build() {
	cd "${srcdir}/${_gitname}-${pkgver}/"
	arch-meson . _build --prefix=/usr
	ninja -C _build
}

package() {
	cd "${srcdir}/${_gitname}-${pkgver}/"
	DESTDIR="${pkgdir}" ninja -C _build install
}

