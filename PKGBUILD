# Maintainer: 3ED <krzysztof1987 _at_ gmail _dot_ com>

pkgname=milena-data
pkgver=0.2.87.1
pkgrel=1
pkgdesc="Milena is a Polish speech synthesizer for Linux (data)"
arch=('any')
url="http://milena.polip.com/"
license=('GPL')
source=(http://tts.polip.com/files/${pkgname}-${pkgver}.tar.gz
        10-makefile_prefix.patch)
sha512sums=('b0e3d52e634ed916f8c0928c8e6aa5303e6c21e6598b524691b3da0235b30fb9401174a1febfeed37322588221bfa08250db1daa9a4ca50e64146c1f6a430fe7'
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
