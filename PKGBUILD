# Maintainer: shirokuro <tod dot jackson at gmail dot com>
# Contributor: giovanni   

pkgname=hd2u
pkgver=1.0.3
pkgrel=7
pkgdesc="Dos2Unix text file converter"
arch=('i686' 'x86_64')
license=('GPL')
url="http://hany.sk/~hany/software/hd2u/"
depends=('popt')
conflicts=('dos2unix')
source=("http://hany.sk/~hany/_data/hd2u/$pkgname-$pkgver.tgz" 'always-false.patch')
sha512sums=('d354964f0ad5392315767b96438d843a5f1d6afe78da5b0c5ea65a3b0b2a61beabff3ecac89df81b9271a14ca443f23dfffeb51815e02b724ad287e42fc2d6cc'
            'fa27ae64ce75fd73ef18207bc46ca8cbdeea66d0d6f3b342d52dbe14a63c23e2c9839bf026382e0c42084a00835235c49039097843b79c2764fe8889a6090ce9')

prepare() {
  cd "$pkgname-$pkgver"

  patch -p1 < ../always-false.patch
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make BUILD_ROOT="$pkgdir" install
}
