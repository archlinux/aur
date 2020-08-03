# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=acl2
pkgver=8.3
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
md5sums=('46f2541b2bb97a93d9b263bc2e387498'
         '6b092e8b98e399dc812f36445f1a9183')

build() {
  cd $srcdir/acl2-$pkgver
}

package() {
  install -Dm755 acl2 $pkgdir/usr/bin/acl2

  cd $srcdir/acl2-$pkgver
  install -d -m755 $pkgdir/opt/acl2
  cp -r . $pkgdir/opt/acl2
}
