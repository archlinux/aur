# Maintainer: Antoine Carpentier <antoine.carpentier.info@gmail.com>
pkgname=cl-jupyter
pkgver=0.7
pkgrel=1
pkgdesc="An enhanced interactive Shell for Common Lisp (based on the Jupyter protocol)"
arch=('any')
url="https://github.com/fredokun/$pkgname"
license=('https://github.com/fredokun/cl-jupyter/blob/master/LICENSE')
source=("git+https://github.com/fredokun/$pkgname")
depends=('sbcl' 'python' 'jupyter-notebook' 'quicklisp' 'asdf')
install=$pkgname.install
sha256sums=('SKIP')

package ()
{
  mkdir -p $pkgdir/usr/lib
  cp -r /usr/lib/quicklisp $pkgdir/usr/lib
  cp -r "$srcdir/$pkgname" "$pkgdir/usr/lib/$pkgname"
  chmod +x "$pkgdir/usr/lib/$pkgname/install-cl-jupyter.py"
	sbcl --no-userinit --load /usr/lib/asdf/asdf --load $pkgdir/usr/lib/quicklisp/setup --load $pkgdir/usr/lib/cl-jupyter/cl-jupyter
  find /usr/lib/quicklisp -type f -exec rm -f $pkgdir{} \;
}

# vim:set ts=2 sw=2 et:
