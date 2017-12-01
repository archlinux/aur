# Maintainer: Alexandre Pujol <alexandre@pujol.io>

pkgname='pass-import'
pkgver=1.0
pkgrel=1
pkgdesc='A generic importer extension for the standard unix password manager pass'
arch=('any')
url='https://github.com/roddhjav/pass-import'
license=('GPL3')
depends=('pass')
optdepends=('python2: for importer script support'
            'python3: for importer script support'
            'ruby: for importer script support'
            'perl: for importer script support')
source=(https://github.com/roddhjav/pass-import/archive/v${pkgver}.tar.gz)
sha512sums=(3aedacec92af75878a9b344e38bfced1b24a84de952440aad1c9b8ef99098587cf4a993e0e16668190bb7b3771dff073809b566828929750bab87eacbc200acd)

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
