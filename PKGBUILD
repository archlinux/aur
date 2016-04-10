# Maintainer: Josh Dye <josh.jpenguin@gmail.com>
# Contributor: Tasos Latsas < tlatsas2000 at gmail dot com >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: damir <damir@archlinux.org>
# Contributor: Kritoke <typeolinux@yahoo.com>
# Contributor: caemir

pkgname=gtkatlantic
pkgver=git
pkgrel=1
pkgdesc="Monopoly board game client for the monopd server."
arch=("i686" "x86_64")
url="http://gtkatlantic.gradator.net/"
license=("GPL")
depends=("gtk3" "git" "muparser" "utf8cpp")
source=("git+git://git.tuxfamily.org/gitroot/gtkatlantic/gtkatlantic.git"
        "gtkatlantic.desktop")

md5sums=("SKIP"
         "8f570f9210682354b21517e6692ed08a")

build() {
  cd "${srcdir}/gtkatlantic"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/gtkatlantic/"

  make DESTDIR="${pkgdir}" install
  install -Dm644 $srcdir/$pkgname.desktop \
      $pkgdir/usr/share/applications/$pkgname.desktop
}
