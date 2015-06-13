# Maintainer: Python Shell <pythonshell@yeah.net>
# Contributor: Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=cbmc-bin
pkgver=5.1
pkgrel=2
pkgdesc="Bounded Model Checking for ANSI-C"
arch=('i686' 'x86_64')
url="http://www.cprover.org/cbmc/"
license=('custom')
provides=('cbmc')
conflicts=('cbmc' 'cbmc-bin')
if test "$CARCH" == x86_64; then
  source=("http://www.cprover.org/cbmc/download/cbmc-5-1-linux-64.tgz")
  sha256sums=('7662f727f52ba9ad6bc280ea0bd26cfe219bf03e30ffb34d5bc745d6a6a217c8')
else
  source=("http://www.cprover.org/cbmc/download/cbmc-5-1-linux-32.tgz")
  sha256sums=('9b9775340b8136e6d83d5a4a689dc84f5f2d905281eb2f3ad71611d8f42e03f8')
fi

package() {
    install -D "${srcdir}/cbmc" "${pkgdir}/usr/bin/cbmc"
    install -D "${srcdir}/hw-cbmc" "${pkgdir}/usr/bin/hw-cbmc"
    install -D "${srcdir}/goto-cc" "${pkgdir}/usr/bin/goto-cc"
    install -D "${srcdir}/goto-instrument" "${pkgdir}/usr/bin/goto-instrument"
    install -D -m644\
        "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/cbmc/LICENSE"
}
