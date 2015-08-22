# Maintainer: 3ED <krzysztof1987 _at_ gmail _dot_ com>

pkgname=milena-data
pkgver=0.2.88.2
pkgrel=1
pkgdesc="Milena is a Polish speech synthesizer for Linux (data)"
arch=('any')
url="http://milena.polip.com/"
license=('GPL')
source=(http://tts.polip.com/files/${pkgname}-${pkgver}.tar.gz
        10-makefile_prefix.patch)
sha512sums=('b2bcbd4906d6534325c86bb71aaa29cffd349f564e6f15c89cececd6b09827f51bd5eed418536c098b446055cf967495d7ca268f5480e9d89a8de5a4c2dca552'
            'e52f77d04b45700de3e298840752332ebe4fcbf75ab79d4d806a3f337c82b3df20500ec213d83cad6deecb185826df912d60e7c26ab0d38a0df28b6d6da8e79d')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "${srcdir}"/10-makefile_prefix.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" prefix="/usr" install
}

# vim:set ts=2 sw=2 et:
