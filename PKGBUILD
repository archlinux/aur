# Maintainer : Bernhard Landauer <oberon@manjaro.org>

pkgname=clipit
_pkgname=ClipIt
pkgver=1.4.4
pkgrel=1
pkgdesc="Lightweight GTK+ clipboard manager (fork of Parcellite)"
arch=('i686' 'x86_64')
url="https://github.com/CristianHenzel/ClipIt/"
_snapshot=d6fab2be79b2fc8319b492a1a834300df64e4db8
license=('GPL3')
depends=('gtk2' 'libappindicator-gtk2')
makedepends=('intltool')
optdepends=('xdotool: for automatic paste')
source=("$url/archive/v$pkgver.tar.gz"
#    "${_pkgname}-${_snapshot}.tar.gz::${url}/archive/${_snapshot}.tar.gz"
    )


build() {
  cd $_pkgname-$pkgver
#  cd "${srcdir}/${_pkgname}-${_snapshot}"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-appindicator
  make
}

package() {
  cd $_pkgname-$pkgver
#  cd "${srcdir}/${_pkgname}-${_snapshot}"
  make DESTDIR=${pkgdir} install
}
md5sums=('d49b9171c0b81269deafab9d6ecc7610')
