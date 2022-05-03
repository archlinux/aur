# Maintainer: Kasper Laudrup <laudrup@stacktrace.dk>

pkgname="brother-dcpj772dw"
pkgver="1.0.5"
pkgrel="0"
pkgdesc="Brother DCP-J772DW CUPS driver"
url="http://brother.co.jp/"
license=('EULA')
install="brother-dcpj772dw.install"
depends=('cups' 'a2ps')
arch=('i686' 'x86_64')

md5sums=(
  'dec4817defb24fd91a59396d9b887b2f'
  '93fa90e28fa298c77d116e0fbf7f6113'
)

source=(
  'fix_lp.patch' \
  "https://download.brother.com/welcome/dlf103541/dcpj772dwpdrv-1.0.5-0.i386.rpm"
)

build() {
  cd "$srcdir"
  patch -Np0 < fix_lp.patch
}

package() {
  install -d "$pkgdir"/usr/bin
  install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj772dw "$pkgdir"/usr/bin/
  cp -R "$srcdir"/opt "$pkgdir"/opt
}

