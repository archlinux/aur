# Maintainer: Mort Yao <soi@mort.ninja>

pkgname=acl2
pkgver=8.1
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
md5sums=('94892c1a269587237cc540a1053cd13d'
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
