# Contributor: Frst21 <bud23@vp.pl>
# Contributor: Chris Down <cdown.uk@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=dehtml
pkgver=1.8
pkgrel=3
pkgdesc="Removes HTML constructs."
arch=('i686' 'x86_64')
url="http://www.moria.de/~michael/dehtml/"
license=('GPL')
provides=('dehtml')
source=("http://www.moria.de/~michael/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('b60f88997c702fa682631787c7b15e2c')
sha1sums=('c931493a4f50b65b0d129f51de025f07784669fb')
sha256sums=('a00e86643b0aa73861e9d8d619a80370f0f99519d34ce12459fab77f5f6b5bde')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc 
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make prefix="$pkgdir/usr" install
}

