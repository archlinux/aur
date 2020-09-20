# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Your Name <youremail@domain.com>
pkgname=python-xdelta3-python
pkgver=0.0.5
pkgrel=1
pkgdesc=""
arch=(any)
url=""
license=('Apache')
groups=()
depends=('python' 'xdelta3')
source=(git+https://github.com/samuelcolvin/xdelta3-python/)
md5sums=(SKIP)

package() {
  cd "$srcdir/xdelta3-python/"
  git submodule update --init --recursive 
  ln -s "$srcdir/xdelta3-python/xdelta/xdelta3/" "$srcdir/xdelta3-python/xdelta3/lib" 
  python setup.py install --root="$pkgdir/"
}

# vim:set ts=2 sw=2 et:
