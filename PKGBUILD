# Maintainer: Python Shell <pythonshell@yeah.net>
# Contributor: Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=cbmc-bin
pkgver=5.7
pkgrel=1
pkgdesc="Bounded Model Checking for ANSI-C"
arch=('i686' 'x86_64')
url="http://www.cprover.org/cbmc/"
license=('custom')
provides=('cbmc')
conflicts=('cbmc' 'cbmc-bin')
if test "$CARCH" == x86_64; then
  source=("http://www.cprover.org/cbmc/download/cbmc-5-7-linux-64.tgz")
  sha256sums=('6ba7f84f38385de8e38b8ee40725ea068bc020ee0e0213aac0c7a06e92b30f55')
else
  source=("http://www.cprover.org/cbmc/download/cbmc-5-7-linux-32.tgz")
  sha256sums=('e3a2af95db990ac3fceaea2160743f61bdac2779c4bc17c989ae7764f95e487a')
fi

package() {
    install -D "${srcdir}/cbmc" "${pkgdir}/usr/bin/cbmc"
    install -D "${srcdir}/goto-cc" "${pkgdir}/usr/bin/goto-cc"
    install -D "${srcdir}/goto-instrument" "${pkgdir}/usr/bin/goto-instrument"
    install -D -m644\
        "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/cbmc/LICENSE"
}
