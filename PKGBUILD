# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-braceexpand'
_pkgname=${pkgname#python-}
pkgver=0.1.6
pkgrel=1
pkgdesc="Bash-style brace expansion"
arch=('any')
depends=()
makedepends=('python-setuptools')
url="https://github.com/trendels/$_pkgname"
license=('GPL3')
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('c1bf4fdc1713e46feacac0f1acbbb12239bdda7c7c4183fc8fb22bf6f285f854')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
