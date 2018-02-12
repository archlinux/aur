# Maintainer : Bernhard Landauer <oberon@manjaro.org>

pkgname=clipit
_pkgname=ClipIt
pkgver=1.4.3
pkgrel=2
pkgdesc="Lightweight GTK+ clipboard manager (fork of Parcellite)"
arch=('i686' 'x86_64')
url="https://github.com/CristianHenzel/ClipIt/"
_snapshot=722fcf73fa0ce8430208c986e50b1c82975de69c
license=('GPL3')
depends=('gtk2' 'libappindicator-gtk2')
makedepends=('intltool')
optdepends=('xdotool: for automatic paste')
source=("${_pkgname}-${_snapshot}.tar.gz::${url}/archive/${_snapshot}.tar.gz")
md5sums=('22eb7756fe35e4ce9a5c75aa8430852e')

build() {
  cd "${srcdir}/${_pkgname}-${_snapshot}"
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-appindicator
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${_snapshot}"
  make DESTDIR=${pkgdir} install
}
