# Maintainer: Python Shell <pythonshell@yeah.net>
# Contributor: Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=cbmc-bin
pkgver=5.6
pkgrel=1
pkgdesc="Bounded Model Checking for ANSI-C"
arch=('i686' 'x86_64')
url="http://www.cprover.org/cbmc/"
license=('custom')
provides=('cbmc')
conflicts=('cbmc' 'cbmc-bin')
if test "$CARCH" == x86_64; then
  source=("http://www.cprover.org/cbmc/download/cbmc-5-6-linux-64.tgz")
  # sha256sum cbmc-5-6-linux-64.tgz
  sha256sums=('671ee433f7fddce0782bd06e87c06970af4d35d9125d23700d37aaff677a0964')
else
  source=("http://www.cprover.org/cbmc/download/cbmc-5-6-linux-32.tgz")
  # sha256sum cbmc-5-6-linux-32.tgz
  sha256sums=('90b166d2dad1e845acdcffe13f46e42877c430789c86779b8e0e51e4d100ce6c')
fi

package() {
    install -D "${srcdir}/cbmc" "${pkgdir}/usr/bin/cbmc"
    install -D "${srcdir}/goto-cc" "${pkgdir}/usr/bin/goto-cc"
    install -D "${srcdir}/goto-instrument" "${pkgdir}/usr/bin/goto-instrument"
    install -D -m644\
        "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/cbmc/LICENSE"
}
