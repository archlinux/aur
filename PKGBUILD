# Maintainer: Petar Petrov <petar.petrov.georgiev at gmail d0t com>
pkgname=shut-up-bird
pkgver=1.0
pkgrel=1
pkgdesc="Create an ePub e-book from your Twitter posts or likes and then (optionally) delete them from your timeline."
arch=('any')
url="https://github.com/petarov/shut-up-bird"
license=('MIT')
groups=()
depends=('python')
makedepends=('python-pip')
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=shut-up-bird.install
source=(https://github.com/petarov/shut-up-bird/archive/$pkgver.tar.gz)
sha1sums=('1677c6dba6cc6187ac0b27cabd4e53f617708985')

runname='ead'

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -Dm755 ${pkgname}.py ${pkgdir}/usr/bin/${pkgname}.py
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
