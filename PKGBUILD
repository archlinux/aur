# Maintainer: 3ED <krzysztofas _at_ protonmail _dot_ com>

pkgname=milena-data
pkgver=0.2.95.1
pkgrel=1
pkgdesc="a Polish speech synthesizer for Linux (data)"
arch=('any')
url="http://milena.polip.com/"
license=('GPL')
source=("http://www.polip.com/files/${pkgname}-${pkgver}.tar.gz"
        "10-makefile_prefix.patch")
sha512sums=('f5c9d516e0a86b7024bd874ec2feea296c15626c30330312b324c1264dc51d6b3120469980fc324281d9e9314193849f49584e85933159e5083ae41f5bb5a938'
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

