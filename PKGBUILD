# Contributor: Artem Sereda <overmind88@gmail.com>
# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=myrulib-git
_pkgname=myrulib
pkgver=20131116
pkgrel=1
pkgdesc="Home library with lib.rus.ec site support"
arch=('i686' 'x86_64')
url="http://www.lintest.ru/wiki/MyRuLib"
license=('GPL')
depends=('wxgtk2.8' 'wxsqlite3-2.8' 'expat')
source=('git+https://github.com/lintest/myrulib.git')
sha1sums=('SKIP')
 
pkgver() {
  cd "${srcdir}/${_pkgname}"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "${srcdir}"/${_pkgname}
  ./configure --prefix=/usr --with-wx-config=/usr/bin/wx-config-2.8
  make
}
 
package() {
  cd "${srcdir}"/${_pkgname}
  make DESTDIR="${pkgdir}" install
}
