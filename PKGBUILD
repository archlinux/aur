# Maintainer :  Sapphira Armageddos <shadowkyogre.public@gmail.com>
# Contributor: jyantis <yantis@yantis.net>
# Contributor: jjdanimoth <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="emerald-themes"
_pkgver=0.8.12
_micro=".1"

pkgname=emerald-themes
pkgver="${_pkgver}${_micro}"
pkgrel=1
pkgdesc="Themes for emerald"
arch=('any')
url="https://github.com/compiz-reloaded/${_upstream}/"
license=('GPL')
depends=('emerald')
makedepends=('intltool' 'pkgconfig')
groups=('compiz-fusion' 'compiz-fusion-kde' 'compiz-fusion-gtk')
conflicts=('emerald-themes-git')
source=("${url}/releases/download/v${pkgver}/${_upstream}-${pkgver}.tar.xz")

build() {
  cd "${srcdir}/${_upstream}-${pkgver}"
  #./autogen.sh
  ./configure --prefix=/usr 
  make
}

package() {
  cd "${srcdir}/${_upstream}-${pkgver}"
  make DESTDIR="${pkgdir}" install 
}

sha256sums=('3ea1635e93b4713e1f7878528d08349f88566136350b10e8bc4b7299a13a6ec8')
