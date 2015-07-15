# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Fabien Devaux <fdev31 @ gmail.com>

_name=glipy
pkgname=python2-$_name
pkgver=1.0
pkgrel=1
pkgdesc="The OpenGL IPython/Python terminal"
arch=(any)
url="http://webloria.loria.fr/~rougier/coding/glipy/"
license=('BSD')
groups=()
depends=('python' 'pyglet' 'ipython' 'python2-numpy')
makedepends=('patch')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://www.loria.fr/~rougier/coding/software/${_name}.tgz)
md5sums=(72f03a34ad9380066a123c44311ed1ef)

package() {
  cd "$srcdir/$_name-beta"
  patch -p0 <<EOF
--- setup.py-orig 2012-11-16 12:42:53.552110104 +0100
+++ setup.py  2012-11-16 12:42:59.135445106 +0100
@@ -8,8 +8,6 @@
 # file file COPYING, distributed as part of this software.
 # -----------------------------------------------------------------------------
 import os
-from ez_setup import use_setuptools
-use_setuptools()
 from setuptools import setup
 
 # BEFORE importing distutils, remove MANIFEST. distutils doesn't properly
EOF

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
