pkgname=python-pylibscrypt-git
pkgrel=1
pkgver=v1.4.0.r37.g6fd3012
arch=(any)
depends=(python)
source=(python-pylibscrypt-git::git://github.com/jvarho/pylibscrypt.git)
md5sums=(SKIP)
provides=(python-pylibscrypt)
conflicts=(python-pylibscrypt)

pkgver() {
  cd "$pkgname"
  git describe --long --tags  | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "$srcdir/$pkgname"
  python setup.py build
}

package(){
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/"  --optimize=1
}
