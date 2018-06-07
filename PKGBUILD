# Maintainer :  Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Contributor: jyantis <yantis@yantis.net>
# Contributor: jjdanimoth <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="emerald-themes"
_pkgver=0.8.14
_micro=""

pkgname=emerald-themes
pkgver="${_pkgver}${_micro}"
pkgrel=2
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

sha256sums=('786d2b3ba9378229fde7fed151730c674ca059ad51c4cea3dd9c1cc54f89e3ee')
