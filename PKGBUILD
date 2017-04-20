# Maintainer: 3ED <krzysztofas _at_ protonmail _dot_ com>

pkgname=milena-data
pkgver=0.2.88.5
pkgrel=1
pkgdesc="Milena is a Polish speech synthesizer for Linux (data)"
arch=('any')
url="http://milena.polip.com/"
license=('GPL')
source=(http://tts.polip.com/files/${pkgname}-${pkgver}.tar.gz
        10-makefile_prefix.patch)
sha512sums=('7ee471aa2948637ef4e5589724aeaf40d5f4d7f59fb0f5aba8f5d6b8029be04cdb53a6a37a393071d34c5849e5862ef09fca726b95ba2d6358f5e5e1c79e7249'
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
