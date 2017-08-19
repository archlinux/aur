# Maintainer: Tarn Burton <twburton at gmail dot com>
# Contributor: Milo Mirate <mmirate at gmx.com>

_pkgname=Pweave
pkgname=python-pweave
pkgver=0.25
pkgrel=1
pkgdesc="A scientific report generator and literate programming tool for Python."
arch=(any)
url="http://mpastell.com/pweave/"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/f6/2f/e9735b04747ae5ef29d64e0b215fb0e11f1c89826097ac17342efebbbb84/$_pkgname-$pkgver.tar.gz")
sha256sums=('1c0f6921196646243eb7ff9eee742305909be2bc7a5eeeb06a7d1f66cc9758c7')

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  rename P p "$pkgdir/usr/bin/P"*
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
