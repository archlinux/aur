# Maintainer: 3ED <krzysztofas _at_ protonmail _dot_ com>

pkgname=milena-data
pkgver=0.2.92.2
pkgrel=1
pkgdesc="a Polish speech synthesizer for Linux (data)"
arch=('any')
url="http://milena.polip.com/"
license=('GPL')
source=("http://www.polip.com/files/${pkgname}-${pkgver}.tar.gz"
        "10-makefile_prefix.patch")
sha512sums=('7d75a115690b956ff6bcce3071c74af7c888380da6042baf097a3b32f7e753b78b9a17f8cf7cbca9cb5638c88fb43e5b9901d567e05391292994d424090adc11'
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

