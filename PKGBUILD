# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Ashwin Vishnu <ashwinvis+arch at pr0t0nm4il dot com>

pkgname=libvarnam
pkgver=3.2.6
pkgrel=4
pkgdesc="Transliteration and reverse transliteration for Indian languages"
arch=('x86_64')
url="https://www.varnamproject.com/"
license=('MPL-2.0')
makedepends=('cmake')
source=("https://github.com/varnamproject/libvarnam/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
b2sums=('00cfa35e443a560a3265efef820da808968f3ddfc63f376239b68b8e8e047dfe0e560e87774d3e5102b9dcda659ce1820aae1b58608e0870165e903e64724ed4')
depends=('ruby' 'ruby-ffi')
provides=('libvarnam')

build() {
  cd ${pkgname}-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir/" install
}
