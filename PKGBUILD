# Maintainer: Franklyn Tackitt <franklyn@tackitt.net>

pkgname=v8-3.14-bin
pkgver=3.14.5.8
pkgrel=1
pkgdesc="v8 3.14 binary package from ubuntu xenial"
url="https://github.com/v8/v8"
arch=('i686' 'x86_64')
license=('BSD new')
depends=()
makedepends=('git')
conflicts=('v8-3.14')
provides=('v8-3.14')

source_i686=("http://mirrors.kernel.org/ubuntu/pool/universe/libv/libv8-3.14/libv8-3.14.5_${pkgver}-5ubuntu2_i386.deb")
source_x86_64=("http://mirrors.kernel.org/ubuntu/pool/universe/libv/libv8-3.14/libv8-3.14.5_${pkgver}-5ubuntu2_amd64.deb")
md5sums_i686=('e773e65367409dc2a737443e2dbfe954')
md5sums_x86_64=('3937ddaf045f8c5606b6c505bf0779f8')

package() {
  msg2 "Unpacking data.tar.xz (Ubuntu package files)"
  tar -xf data.tar.xz
  
  install -Dm644 ${srcdir}/usr/lib/libv8.so.3.14.5 ${pkgdir}/usr/lib/libv8.so.3.14.5
  install -Dm644 ${srcdir}/usr/share/doc/libv8-3.14.5/AUTHORS ${pkgdir}/usr/share/doc/libv8-3.14.5/AUTHORS
  install -Dm644 ${srcdir}/usr/share/doc/libv8-3.14.5/copyright ${pkgdir}/usr/share/doc/libv8-3.14.5/copyright

  msg2 "Fixing permissions differences between Ubuntu and Arch"
  find ${pkgdir} -type d -exec chmod -cR 755 "{}" \;
  find ${pkgdir}/usr/{lib,share} -type f -exec chmod -cR 644 "{}" \;
}

