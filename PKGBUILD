# Maintainer: ELmoussaoui Bilal <bil.elmoussaoui@gmail.com>

pkgname=gnome-twofactorauth
_gitname=Gnome-TwoFactorAuth
pkgver=0.1.1
pkgrel=1
pkgdesc='Two-Factor Authentication code generator for Gnome'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/bil-elmoussaoui/${_gitname}"
depends=('desktop-file-utils' 'gobject-introspection' 'gtk3' 'gnome-screenshot' 'python-pillow' 'python-gobject' 'python-yaml' 'python-cairo' 'python-pyotp' 'python-zbarlight')
makedepends=('unzip' 'gnome-common' 'intltool' 'itstool' 'python' 'yelp-tools')


options=('!emptydirs')
install=gnome-twofactorauth.install
source=("https://github.com/bil-elmoussaoui/${_gitname}/archive/v${pkgver}.zip")
md5sums=('f77324cb7431bdc98a8c990f0307ef8b')
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
