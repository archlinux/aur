# Maintainer: Jean-Luc Tambasco <an.obscurity@gmail.com>
_pkgname=opticalmaterialspy
pkgname=python-opticalmaterialspy
pkgver=r25.246a76c
pkgrel=1
pkgdesc="Python library with optical material properties."
arch=('any')
url="https://github.com/jtambasco/opticalmaterialspy"
license=('MIT')
makedepends=('python' 'python-setuptools' 'python-numpy' 'python-scipy')
source=('git+https://github.com/jtambasco/opticalmaterialspy.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
