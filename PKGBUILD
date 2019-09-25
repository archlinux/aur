# Maintainer: Bradan J. Wolbeck <bwolbeck@compaqdisc.com>
# Contributor: Sean Enck <enckse@gmail.com>
# Contributor: John K. Luebs <https://github.com/jkl1337>

pkgname=zasm
pkgver=4.2.5
pkgrel=1
pkgdesc="A 2-pass assembler for the Zilog 8-bit Z80 CPU"
arch=('any')
url="http://k1.spdns.de/Develop/Projects/zasm/"
license=('BSD')
source=("git+https://bitbucket.org/megatokio/zasm.git#commit=39d265e481e4180c1c6681d8b1d661cc1b8136e9"
        "git+https://bitbucket.org/megatokio/libraries.git#commit=9684213b6861bf7f9f45305f78927379f648d30c")
sha256sums=('SKIP' 'SKIP')

build() {
  cd ${srcdir}/${pkgname}
  rm -rf Libraries
  ln -s ../libraries Libraries
  cd Linux
  make
}

package() {
  cd ${srcdir}/${pkgname}/Linux
  install -Dm755 zasm "${pkgdir}/usr/bin/zasm"
}

