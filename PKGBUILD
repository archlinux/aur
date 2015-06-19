# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=ttcp
pkgver=20100419
pkgrel=1
pkgdesc="TCP benchmarking tool"
arch=('i686' 'x86_64')
url="http://www.pcausa.com/Utilities/pcattcp.htm"
license=('custom:Public Domain')
depends=('glibc')
source=("http://www.pcausa.com/Utilities/pcattcp/LinuxTTCP.zip"
        "LICENSE")
md5sums=('5b4707910c24fec212609f862bc53749'
         'd8d09df3d799fec1b0b8a080948ffbb2')

build() {
  cd "${srcdir}/LinuxTTCP"
  [ -f makefile ] && rm -f makefile
  make ttcp
}

package() {
  cd "$srcdir/LinuxTTCP"
  install -D -m755 ttcp "${pkgdir}/usr/bin/ttcp"
  install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/ttcp/LICENSE"
}

# vim:set ts=2 sw=2 et:
