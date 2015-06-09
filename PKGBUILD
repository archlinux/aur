# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-securestring
_pipname=SecureString
pkgver=0.1
pkgrel=1
pkgdesc="Clears the contents of strings containing cryptographic material"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/dnet/pysecstr"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/S/$_pipname/$_pipname-$pkgver.tar.gz
        https://pypi.python.org/packages/source/S/$_pipname/$_pipname-$pkgver.tar.gz.asc)
md5sums=('c84ac003a0e1dad96d80fa696ccb96fc'
         '6f3ed918802f91508a0b708ebdfe4fc4')
sha256sums=('46b5c3b2be2e7cbee81be8964596fad9150a581daabab20dbfe785e186607b3c'
            '823954eadef1387fbfcadee9346c821b569c128f09f18b78a19669ae10bfd167')
validpgpkeys=('278F163FABB0EFE41289BAA07559181E94176CCC')

build() {
  cd "$srcdir/$_pipname-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pipname-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
