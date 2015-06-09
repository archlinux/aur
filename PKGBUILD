# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=acl2
pkgver=7.1
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
md5sums=('2d1cc71bc7b6982c6002111f91545fc7'
         '284866c01f07fb5271e0a567cf93b228')

build() {
  cd $srcdir/acl2-$pkgver
}

package() {
  install -Dm755 acl2 $pkgdir/usr/bin/acl2

  cd $srcdir/acl2-$pkgver
  install -d -m755 $pkgdir/opt/acl2
  cp -r . $pkgdir/opt/acl2
}
