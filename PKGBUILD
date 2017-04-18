# $Id$
# Maintainer: martadinata666 <martadinata666@gmail.com>
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: JJDaNiMoTh <jjdanimoth@gmail.com>
# Contributor: nesl247 <nesl247@gmail.com>

_upstream="emerald"
_pkgver=0.8.14
_micro=""

pkgname=emerald
pkgver="${_pkgver}${_micro}"
pkgrel=1
pkgdesc="Emerald window decorator"
arch=('i686' 'x86_64')
url="https://github.com/compiz-reloaded/${_upstream}/"
license=('GPL')
depends=("compiz-core>=${_pkgver}" 'libwnck' 'libxres' 'shared-mime-info' 'xdg-utils' \
         'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('intltool' 'pkg-config' 'gettext')
groups=('compiz-fusion' 'compiz-fusion-kde' 'compiz-fusion-gtk')
options=(!libtool)
conflicts=('emerald0.9')
source=(
  "${url}/releases/download/v${pkgver}/${_upstream}-${pkgver}.tar.xz"
)

build() {
  cd "${srcdir}/${_upstream}-${pkgver}"

  NOCONFIGURE=1 LIBS+="-lm -ldl" ./autogen.sh
  ./configure --prefix=/usr --with-gtk=2.0

  make
}

package() {
  cd "${srcdir}/${_upstream}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

sha256sums=('d5dd3be562b1fb4b1d5d620c43249cec82db58baef63f0a14ab08003daecdb6c'
            '7b62603680137426016f76baf81e7ed2781750b09bc356ae994e4388c2e63f97')
sha256sums=('a87f6a7a077da156dd9985998ac2381b525f1d593ef4d5b27e30d016f3868261')
