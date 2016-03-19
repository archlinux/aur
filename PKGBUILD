# Maintainer: Python Shell <pythonshell@yeah.net>
# Contributor: Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=cbmc-bin
pkgver=5.4
pkgrel=1
pkgdesc="Bounded Model Checking for ANSI-C"
arch=('i686' 'x86_64')
url="http://www.cprover.org/cbmc/"
license=('custom')
provides=('cbmc')
conflicts=('cbmc' 'cbmc-bin')
if test "$CARCH" == x86_64; then
  source=("http://www.cprover.org/cbmc/download/cbmc-5-4-linux-64.tgz")
  sha256sums=('63d67d99b9e687d81fe828904768a423b5bafa3084a28cfea2e6972fdd117a8d')
else
  source=("http://www.cprover.org/cbmc/download/cbmc-5-4-linux-32.tgz")
  sha256sums=('7d35463a7f914111d20da1ba53c10bad7c80eb175f1435193f11ec50b41545c3')
fi

package() {
    install -D "${srcdir}/cbmc" "${pkgdir}/usr/bin/cbmc"
    install -D "${srcdir}/goto-cc" "${pkgdir}/usr/bin/goto-cc"
    install -D "${srcdir}/goto-instrument" "${pkgdir}/usr/bin/goto-instrument"
    install -D -m644\
        "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/cbmc/LICENSE"
}
