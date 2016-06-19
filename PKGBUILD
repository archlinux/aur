# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=gnome-twofactorauth
_gitname=Gnome-TwoFactorAuth
pkgver=0.1beta3
pkgrel=1
pkgdesc='Two-Factor Authentication code generator for Gnome'
arch=('i686' 'x86_64')
license=('GPL3')
url	="https://github.com/bil-elmoussaoui/${_gitname}"
depends=('desktop-file-utils' 'gobject-introspection' 'gtk3' 'python-gobject' 'python-cairo' 'python-pyotp')
makedepends=('git' 'gnome-common' 'intltool' 'itstool' 'python' 'yelp-tools')

options=('!emptydirs')
install=gnome-twofactorauth.install
source=("https://github.com/bil-elmoussaoui/${_gitname}/archive/v${pkgver}.zip")
md5sums=('e482bae629932e395e48b35a82568f0a')
conflicts=('gnome-twofactorauth-git')
provides=("gnome-twofactorauth=$pkgver")

build() {
	cd "$srcdir/${_gitname}-${pkgver}"
	./autogen.sh --prefix=/usr  --disable-schemas-compile
	make
}

package() {
	cd "$srcdir/${_gitname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
