# Maintainer: tr-mtzk <tr.mtzk@gmail.com>

pkgname="brother-dcpj582n"
pkgver="1.0.5"
pkgrel="0"
pkgdesc="Brother DCP-J582N CUPS driver"
url="http://brother.co.jp/"
license=('EULA')
install="brother-dcpj582n.install"
depends=('cups' 'a2ps' 'lib32-gcc-libs')
arch=('i686' 'x86_64')

md5sums=(
  '341b0c2528985336ec0a0f539809a87b'
  '0877c76c218a9f2e0709f58fcd70c3a5'
)

source=(
  'fix_lp.patch' \
  "https://download.brother.com/welcome/dlf104685/dcpj582npdrv-$pkgver-$pkgrel.i386.rpm"
)

build() {
  cd "$srcdir"
  patch -Np0 < fix_lp.patch
}

package() {
  install -d "$pkgdir"/usr/bin
  install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj582n "$pkgdir"/usr/bin/
  cp -R "$srcdir"/opt "$pkgdir"/opt
}

