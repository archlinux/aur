# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Matteo Mattei <matteo.mattei@gmail.com>

pkgname=libminilector38u-bit4id
pkgver=1
pkgrel=3
pkgdesc="Firmware for minilector bit4id smart card reader"
arch=('i686' 'x86_64')
url="http://www.bit4id.com/"
license=('GPL')
depends=('lib32-glibc')
source=("http://www.pkgbuild.com/~giovanni/Linux.zip")
md5sums=('913db070c3b677fc5c4ff08c874781c7')

package() {
  cd "${srcdir}"

  bsdtar -xf 2008_10_09_linux_ACR38Driver.bundle.zip
  install -d ${pkgdir}/usr/lib/bit4id
  rm -rf ACR38Driver.bundle/Contents/MacOS
  chmod -R 0755 ACR38Driver.bundle
  cp -a ACR38Driver.bundle ${pkgdir}/usr/lib/bit4id
}
