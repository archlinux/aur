# Maintainer: Python Shell <pythonshell@yeah.net>
# Contributor: Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=cbmc-bin
pkgver=5.8
pkgrel=1
pkgdesc="Bounded Model Checking for ANSI-C"
arch=('i686' 'x86_64')
url="http://www.cprover.org/cbmc/"
license=('custom')
provides=('cbmc')
conflicts=('cbmc' 'cbmc-bin')
if test "$CARCH" == x86_64; then
  source=("http://www.cprover.org/cbmc/download/cbmc-5-8-linux-64.tgz")
  sha256sums=('fdb91b32baa7ba54d62024a8b271cd8ee1426c5a4341e24dba5c5ae82303ba74')
else
  source=("http://www.cprover.org/cbmc/download/cbmc-5-8-linux-32.tgz")
  sha256sums=('8140c0dda9ec3d2808c38235ad7d1e00dd3f118cd46dfe0b2f14610b93627185')
fi

package() {
    install -D "${srcdir}/cbmc" "${pkgdir}/usr/bin/cbmc"
    install -D "${srcdir}/goto-cc" "${pkgdir}/usr/bin/goto-cc"
    install -D "${srcdir}/goto-instrument" "${pkgdir}/usr/bin/goto-instrument"
    install -D -m644\
        "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/cbmc/LICENSE"
}
