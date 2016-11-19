# Maintainer : Antoine Carpentier
pkgname=quicklisp
pkgver=0.1
pkgrel=3
epoch=1
pkgdesc="A library manager for Common Lisp"
arch=('any')
url="https://www.quicklisp.org"
license=("bsd")
optdepends=('sbcl' 'ccl-svn')
makedepends=('sbcl')
source=('https://beta.quicklisp.org/quicklisp.lisp')
sha256sums=('4a7a5c2aebe0716417047854267397e24a44d0cce096127411e9ce9ccfeb2c17')
install=$pkgname.install

package()
{
  echo -ne "(quicklisp-quickstart:install :path \"$pkgdir/usr/lib/$pkgname\")\n(quit)\n" | sbcl --no-userinit --load quicklisp.lisp
  chmod 777 -R $pkgdir/usr/lib/$pkgname/dists
  chmod 777 -R $pkgdir/usr/lib/$pkgname/local-projects
  mkdir -p $pkgdir/etc/default
  echo -ne "(load \"/usr/lib/$pkgname/setup\")\n" > $pkgdir/etc/default/$pkgname
}

# vim:set ts=2 sw=2 et:

