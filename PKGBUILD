pkgname=unenigmail
pkgver=0.20
pkgrel=1
url='https://github.com/RoffelKartoffel/unenigmail'
license=('none')
pkgdesc='Unenigmail strips Enigmails PGP encryption from emails within a supplied mbox file.'
arch=('i686' 'x86_64')
makedepends=('qt5-base')
provides=('unenigmail')
source=("${pkgname}::git://github.com/RoffelKartoffel/unenigmail.git")
md5sums=('SKIP')



build() {
  cd ${pkgname}
  sh ./configure.sh
  cd build.release
  make -j
}

package() {
  mkdir ${pkgdir}/usr/bin -p
  cp ${pkgname}/build.release/unenigmail ${pkgdir}/usr/bin
}


