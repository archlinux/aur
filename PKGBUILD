# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
# Contributor: Michael Borders <michael.a.borders@gmail.com>

pkgname=python-parmed
_pkgname=ParmEd
pkgver=4.3.0
pkgrel=1
pkgdesc="Amber parameter file editor"
arch=('any')
url="https://parmed.github.io/ParmEd"
license=('LGPL2.1')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/ParmEd/ParmEd/archive/${pkgver}.tar.gz")
b2sums=('66da35ece5f6c244b8205f3889bee3c86471b3d54814ba3dd6096ab5f057b1276d74b1fe4f37523a629ecb18412aafddc0ed13e68d24abe10dda40247d0b30e4')

build() {
        cd "ParmEd-$pkgver" || exit
        python setup.py build
}

check() {
	true
}

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 GNU_LGPL_v2 "$pkgdir/usr/share/licenses/$pkgname/GNU_LGPL_v2"
}
