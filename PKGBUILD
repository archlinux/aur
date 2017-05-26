# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=dconf-editor
pkgver=3.20.3
pkgname=${_pkgname}-${pkgver%.*}
pkgrel=1
pkgdesc="dconf configuration editor (old interface)"
arch=(i686 x86_64)
url="https://wiki.gnome.org/Projects/dconf"
license=(GPL3)
depends=('gtk3' 'dconf')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver}")
makedepends=('vala' 'intltool')
source=(http://download.gnome.org/sources/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.xz)
sha256sums=('a8721499a277550b28d8dd94dafbea6efeb95fa153020da10603d0d4d628c579')

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
