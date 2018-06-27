# Maintainer: Python Shell <pythonshell@yeah.net>
# Contributor: Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=cbmc-bin
pkgver=5.9
pkgrel=1
pkgdesc="Bounded Model Checking for ANSI-C"
arch=('i686' 'x86_64')
url="http://www.cprover.org/cbmc/"
license=('custom')
provides=('cbmc')
conflicts=('cbmc' 'cbmc-bin')
if test "$CARCH" == x86_64; then
  source=("http://www.cprover.org/cbmc/download/cbmc-5-9-linux-64.tgz")
  sha256sums=('1932458de5d9bc02145b4370754c991045adea09b9ccdcce89bf4df772638ebd')
else
  source=("http://www.cprover.org/cbmc/download/cbmc-5-9-linux-32.tgz")
  sha256sums=('1a8db38996f4dcb88f0ad2503c9abef088c44b61eaf328f509d0a676ff49b127')
fi

package() {
    install -D "${srcdir}/cbmc" "${pkgdir}/usr/bin/cbmc"
    install -D "${srcdir}/goto-cc" "${pkgdir}/usr/bin/goto-cc"
    install -D "${srcdir}/goto-instrument" "${pkgdir}/usr/bin/goto-instrument"
    install -D -m644\
        "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/cbmc/LICENSE"
}
