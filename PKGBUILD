# Maintainer: Python Shell <pythonshell@yeah.net>
# Contributor: Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=cbmc-bin
pkgver=5.3
pkgrel=2
pkgdesc="Bounded Model Checking for ANSI-C"
arch=('i686' 'x86_64')
url="http://www.cprover.org/cbmc/"
license=('custom')
provides=('cbmc')
conflicts=('cbmc' 'cbmc-bin')
if test "$CARCH" == x86_64; then
  source=("http://www.cprover.org/cbmc/download/cbmc-5-3-linux-64.tgz")
  sha256sums=('64b7ce9fb277064fd6f4c67ac40b94499688bf61d9db68fa80684b241b838beb')
else
  source=("http://www.cprover.org/cbmc/download/cbmc-5-3-linux-32.tgz")
  sha256sums=('38972dabad356536c1f703ab2ce9b5ccb90230b5ccc72306a0a041c13eb7e8f5')
fi

package() {
    install -D "${srcdir}/cbmc" "${pkgdir}/usr/bin/cbmc"
    install -D "${srcdir}/goto-cc" "${pkgdir}/usr/bin/goto-cc"
    install -D "${srcdir}/goto-instrument" "${pkgdir}/usr/bin/goto-instrument"
    install -D -m644\
        "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/cbmc/LICENSE"
}
