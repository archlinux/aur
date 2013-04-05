# Maintainer: Vianney le Clément <vleclement AT gmail · com>
_pkgname=python-supergenpass
pkgname=$_pkgname-git
pkgver=20130209.gfc9e077
pkgrel=1
pkgdesc="SuperGenPass Python module and GTK interface"
arch=(any)
url="https://github.com/vianney/python-supergenpass"
license=('GPL3')
depends=('python')
makedepends=('git')
optdepends=('gtk3: for GTK interface'
            'python-gobject: for GTK interface')
source=("git://github.com/vianney/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  _date=$(git show -s --format='%ci' | cut -d' ' -f1 | sed 's/-//g')
  _hash=$(git show -s --format='%h')
  echo "$_date.g$_hash"
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim:set ts=2 sw=2 et:
