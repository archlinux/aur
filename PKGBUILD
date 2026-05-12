# Contributor: Mort Yao <soi@mort.ninja>
# Mantainer: Pablo Beato <private04@esi.uca>

pkgname=acl2
pkgver=8.7
pkgrel=1
pkgdesc='ACL2 theorem prover.'
url='http://www.cs.utexas.edu/users/moore/acl2/'
license=('BSD')
depends=('sbcl')
arch=('i686' 'x86_64')
options=('!strip')
install=$pkgname.install
source=("https://github.com/acl2-devel/acl2-devel/releases/download/$pkgver/acl2-$pkgver.tar.gz"
        'acl2')
sha256sums=('370433766f56737e597b09c0fd8f837d2df889ec8ed51efa9fc869a93185ce89'
	    '7c04f9c55f86a07133323e0489c0ba876dac24bc5bf3fc83e8e70f65410e1ba9')

build() {
  cd $srcdir/acl2-$pkgver
}

package() {
  install -Dm755 acl2 $pkgdir/usr/bin/acl2
  cd $srcdir/acl2-$pkgver
  install -d -m755 $pkgdir/opt/acl2
  cp -r . $pkgdir/opt/acl2
}
