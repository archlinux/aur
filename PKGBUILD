# Maintainer: Sean Enck <enckse@gmail.com>
_name=pyxstitch
pkgname=python-$_name
pkgver=1.7.2
pkgrel=2
pkgdesc="takes source code files and produces syntax-highlighted patterns for cross stitching."
arch=("any")
url="https://github.com/enckse/$_name"
license=('MIT')
depends=('python' 'python-pillow' 'python-pygments')
_md5='597c0a895b453f0c2a090280ed16aff5'
source=("https://pypi.python.org/packages/17/06/5b6c179e7fbf26fdfd718290cc8a5d6d2de4da67f2c73d1a31c4472484ef/$_name-$pkgver.tar.gz#md5=$_md5"
        "https://raw.githubusercontent.com/enckse/$_name/master/LICENSE")
md5sums=("$_md5" "09b2ac6fbde8b1a1c4f223aa3ffedbba")
package() {
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
