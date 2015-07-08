# Maintainer: Adam Howard <aeh@aehdev.net>
pkgname=python-send2trash
_pypiname=Send2Trash
pkgver=1.3.0
pkgrel=1
pkgdesc="Send file to trash natively under Mac OS X, Windows and Linux"
arch=(any)
url="https://pypi.python.org/pypi/Send2Trash/"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
conflicts=('send2trash')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/S/$_pypiname/$_pypiname-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/hsoft/send2trash/$pkgver/LICENSE")
sha256sums=('33f4461eae831eb09a21b70ca202c2a6dfd83db6bafa1e1ca11b5001e22c58fe'
            'f3b3cb683064a3e33b28870b3610a976a948a1edb7d8b6fc00887b3b4398a4f2')

package() {
  cd "$srcdir/$_pypiname-$pkgver"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
