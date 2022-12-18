# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Maintainer: A.T.W.A. <arch.atwa@gmail.com>

pkgname=gxkb-ru-by-flags
pkgver=0.9.4
pkgrel=1
commit=87b9dfe917be7ba6f7aae8ae73f781f94833d517
pkgdesc="X11 keyboard indicator and switcher with Russian and Belarusian flags included"
arch=('x86_64')
url="https://zen-tools.github.io/gxkb"
license=('GPL2')
depends=('libxklavier' 'libwnck3' 'gtk3')
conflicts=('gxkb')
source=("https://github.com/kyak/${pkgname}/archive/${commit}.tar.gz")
sha256sums=('2c8a516f78a2c5c4fcb66c327c1be0ec020fecc79e1305129717f05a66272ede')

build() {
  cd "${srcdir}/${pkgname}-${commit}"
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  ./autogen.sh
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${commit}"
  make DESTDIR="${pkgdir}" install
}
