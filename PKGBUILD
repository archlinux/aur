# Maintainer: 
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Roman Kyrylych <Roman.Kyrylych@gmail.com>
# Contributor: lp76 <l.peduto@gmail.com>

pkgname=gpg-crypter
pkgver=0.4.1
pkgrel=4
pkgdesc="A graphical front-end to GnuPG(GPG) using the GTK3 toolkit and libgpgme"
arch=('x86_64')
url="http://gpg-crypter.sourceforge.net/"
license=('GPL2')
depends=('gtk3' 'gpgme')
makedepends=('intltool')
changelog=${pkgname}.changelog
source=(https://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('300f1c313fb9f6cc5a1def24e2783cd4b40a8ed1f81b35201399374817b314c1e21bb0fd1dda10ba78f6dc6ffdbf5b26ffb57734eb1cb644650db7f97de7bb23')

build() {
  cd ${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
}
