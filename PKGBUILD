# Maintainer :  Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Contributor: jyantis <yantis@yantis.net>
# Contributor: jjdanimoth <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>
# Contributor: KafCoppelia <k740677208@gmail.com>

pkgname=emerald-themes
pkgver=0.8.18
pkgrel=2
pkgdesc="Themes for Emerald Compiz decorator"
arch=('any')
url="https://gitlab.com/compiz/${pkgname}/"
license=('GPL-3.0-or-later')
depends=('emerald')
makedepends=('intltool' 'pkgconfig')
groups=('compiz-fusion' 'compiz-fusion-kde' 'compiz-fusion-gtk')
conflicts=('emerald-themes-git')
source=("${url}-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('54e563a4ed785b7d579a6579ff5d42c0e28fd3e0027398398b260a869ea114e1')
options=('!strip')


build() {
  cd ${srcdir}/${pkgname}-v${pkgver}
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr 
  make
}

package() {
  cd ${srcdir}/${pkgname}-v${pkgver}
  make DESTDIR="${pkgdir}" install 
}
