# Maintainer :  Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Contributor: jyantis <yantis@yantis.net>
# Contributor: jjdanimoth <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="emerald-themes"
_pkgver=0.8.18
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

sha256sums=('54e563a4ed785b7d579a6579ff5d42c0e28fd3e0027398398b260a869ea114e1')
