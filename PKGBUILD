pkgname=unenigmail
pkgver=0.5
pkgrel=1
url='https://github.com/RoffelKartoffel/unenigmail'
license=('none')
pkgdesc='Unenigmail strips Enigmails PGP encryption from emails within a supplied mbox file.'
arch=('i686' 'x86_64')
makedepends=('fpc' 'lazarus')
provides=('unenigmail')
source=("${pkgname}::git://github.com/RoffelKartoffel/unenigmail.git")
md5sums=('SKIP')



build() {
  cd ${pkgname}
  lazbuild --build-mode=Release unenigmail.lpi
}

package() {
  mkdir ${pkgdir}/usr/bin -p
  cp ${pkgname}/bin/unenigmail ${pkgdir}/usr/bin
}


