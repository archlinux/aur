# Maintainer :  Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Contributor: jyantis <yantis@yantis.net>
# Contributor: jjdanimoth <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="emerald-themes"
_pkgver=0.8.16
_micro=""

pkgname=emerald-themes
pkgver="${_pkgver}${_micro}"
pkgrel=1
pkgdesc="Themes for emerald"
arch=('any')
url="https://gitlab.com/compiz/${_upstream}/"
license=('GPL')
depends=('emerald')
makedepends=('intltool' 'pkgconfig')
groups=('compiz-fusion' 'compiz-fusion-kde' 'compiz-fusion-gtk')
conflicts=('emerald-themes-git')
source=("${url}-/archive/v${pkgver}/${_upstream}-v${pkgver}.tar.bz2")

build() {
  cd "${srcdir}/${_upstream}-v${pkgver}"
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr 
  make
}

package() {
  cd "${srcdir}/${_upstream}-v${pkgver}"
  make DESTDIR="${pkgdir}" install 
}

sha256sums=('5e5cb2e2ebdbcbe44d03cf48caa8460c3e9b18ca78b0583946a824e1548b75e7')
