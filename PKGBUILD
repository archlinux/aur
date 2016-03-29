# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgbase=python-mwclient
pkgname=('python-mwclient' 'python2-mwclient')
pkgdesc="A Python framework to interface with the MediaWiki API"
pkgver=0.8.1
pkgrel=2
arch=('any')
url="https://github.com/mwclient/mwclient"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mwclient/mwclient/archive/v${pkgver}.tar.gz")

build() {
  cd $srcdir
  cp -r mwclient-$pkgver mwclient2-$pkgver
}

check() {
  cd $srcdir/mwclient-$pkgver
  which python3 && python3 setup.py check

  cd $srcdir/mwclient2-$pkgver
  which python2 && python2 setup.py check
}

package_python-mwclient() {
  depends=('python')
  cd $srcdir/mwclient-$pkgver
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

package_python2-mwclient() {
  depends=('python2')
  cd $srcdir/mwclient2-$pkgver
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

sha1sums=('5cf98b36be4341f01817a46e8277f3fa633dfd77')
sha256sums=('4dde79a603e0fa4e1c8abd1b296dd08676d68d2ce77b5722a55b5ef83c6dd753')
