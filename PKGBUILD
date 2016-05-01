# Maintainer: 3ED <krzysztof1987 _at_ gmail _dot_ com>

pkgname=milena-data
pkgver=0.2.88.4
pkgrel=1
pkgdesc="Milena is a Polish speech synthesizer for Linux (data)"
arch=('any')
url="http://milena.polip.com/"
license=('GPL')
source=(http://tts.polip.com/files/${pkgname}-${pkgver}.tar.gz
        10-makefile_prefix.patch)
sha512sums=('0b1d398838f3b8730de1f3c18581b040195dc1b13bfd87211ff965d4f5ff92ca461606e59dcbe43f3bdc32d16f21aa5df7ab256c8e001d2d5e6af9a48d669ee6'
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
