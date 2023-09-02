# Maintainer:  Jonathan Steel <jsteel at archlinux.org>
# Contributor: mawcomw <mawcomw@gmail.com>

pkgname=python-argparse
pkgver=1.4.0
pkgrel=14
arch=('any')
pkgdesc="Python3 command-line parsing library"
url="https://pypi.python.org/pypi/argparse"
license=('Python')
depends=('python')
makedepends=('python' 'python-setuptools')
source=("https://pypi.python.org/packages/source/a/argparse/argparse-$pkgver.tar.gz")
sha256sums=('62b089a55be1d8949cd2bc7e0df0bddb9e028faefc8c32038cc84862aefdd6e4')

build() {
  cd argparse-$pkgver
  python setup.py build
}

check(){
  cd argparse-$pkgver
  python -m unittest discover -vs test
}

package() {
  cd argparse-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
}
