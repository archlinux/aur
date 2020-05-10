# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Joseph Brains <jnbrains@gmail.com>

_pkgname=python-prompt_toolkit
pkgname="$_pkgname"-gns3
_name=prompt_toolkit
pkgver=3.0.5
pkgrel=1
pkgdesc="Library for building powerful interactive command lines in Python (GNS3)"
arch=('any')
depends=('python-pygments' 'python-six' 'python-wcwidth')
makedepends=('python-setuptools')
url="https://github.com/jonathanslenders/python-prompt-toolkit"
license=('BSD')
groups=('gns3')
options=(!emptydirs)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://files.pythonhosted.org/packages/source/p/$_name/$_name-$pkgver.tar.gz")
sha256sums=('563d1a4140b63ff9dd587bda9557cffb2fe73650205ab6f4383092fb882e7dc8')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
