# Maintainer : jyantis <yantis@yantis.net>
# Contributor: jjdanimoth <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="emerald-themes"
_pkgver=0.8.12
_micro=""

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

sha256sums=('b9b2e4bb10765d8a242d54698d07a48b64be6156b8a1990d4edd6b2ebb82fce4')
