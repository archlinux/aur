# Maintainer: Python Shell <pythonshell@yeah.net>
# Contributor: Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=cbmc-bin
pkgver=5.2
pkgrel=1
pkgdesc="Bounded Model Checking for ANSI-C"
arch=('i686' 'x86_64')
url="http://www.cprover.org/cbmc/"
license=('custom')
provides=('cbmc')
conflicts=('cbmc' 'cbmc-bin')
if test "$CARCH" == x86_64; then
  source=("http://www.cprover.org/cbmc/download/cbmc-5-2-linux-64.tgz")
  sha256sums=('2067d49ac4c8179c13e3d5fec0b43949c3fffb905feec9cd92b58e3d0fb540e8')
else
  source=("http://www.cprover.org/cbmc/download/cbmc-5-2-linux-32.tgz")
  sha256sums=('c1123bc6af3bb4b52917530361ae6093cb69de74ff8dc0bbdf27f35bcb73b8c9')
fi

package() {
    install -D "${srcdir}/cbmc" "${pkgdir}/usr/bin/cbmc"
    install -D "${srcdir}/hw-cbmc" "${pkgdir}/usr/bin/hw-cbmc"
    install -D "${srcdir}/goto-cc" "${pkgdir}/usr/bin/goto-cc"
    install -D "${srcdir}/goto-instrument" "${pkgdir}/usr/bin/goto-instrument"
    install -D -m644\
        "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/cbmc/LICENSE"
}
