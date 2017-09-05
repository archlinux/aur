# Maintainer: 0strodamus <0strodamus at cox dot net>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor:  <mathieu.clabaut@gmail.com>

pkgname=xdg-user-dirs-nosystemd
_pkgname=xdg-user-dirs
pkgver=0.16
pkgrel=1
pkgdesc="Manage user directories like ~/Desktop and ~/Music"
arch=(i686 x86_64)
url="http://www.freedesktop.org/wiki/Software/xdg-user-dirs"
license=(GPL)
depends=('sh')
makedepends=('docbook-xsl')
provides=('xdg-user-dirs')
conflicts=('xdg-user-dirs')
backup=(etc/xdg/user-dirs.conf etc/xdg/user-dirs.defaults)
source=("http://user-dirs.freedesktop.org/releases/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('770fb42c8809d192c661585a0ee9ed9b65ebaca7532abe7dd68eca0e4962e3e6')

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
