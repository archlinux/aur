# Maintainer: 3ED <krzysztofas _at_ protonmail _dot_ com>

pkgname=milena-data
pkgver=0.2.90.1
pkgrel=1
pkgdesc="Milena is a Polish speech synthesizer for Linux (data)"
arch=('any')
url="http://milena.polip.com/"
license=('GPL')
source=("http://www.polip.com/files/${pkgname}-${pkgver}.tar.gz"
        "10-makefile_prefix.patch")
sha512sums=('0f88e287c1cff1fa0b038ab46ae0d8ff26f597b69896be1a82aeae14ed7f57bcc6b570f325dbc9a88aecc7334bbb66331024ebe67b99025ee78b5b8622656a75'
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
