# Maintainer: Sean Enck <enckse@gmail.com>
_name=pyxstitch
pkgname=python-$_name
pkgver=1.7.4
pkgrel=1
pkgdesc="takes source code files and produces syntax-highlighted patterns for cross stitching."
arch=("any")
url="https://github.com/enckse/$_name"
license=('MIT')
depends=('python' 'python-pillow' 'python-pygments')
optdepends=("bash-completion: for bash completions")
_md5='b2fe3d58780f42796fb3dfa7c99d1371'
_rawcontent="https://raw.githubusercontent.com/enckse/$_name/$pkgver/"
source=("https://pypi.python.org/packages/fa/5a/03d6f4e539e0c562472bbf9303c568ac7cdc1f6189640c598051ee4a0abb/$_name-$pkgver.tar.gz#md5=$_md5"
        "${_rawcontent}LICENSE"
        "${_rawcontent}completions/bash")
md5sums=("$_md5" "09b2ac6fbde8b1a1c4f223aa3ffedbba" "d4f45e5816e653b3ba21c779bbe9e5da")
package() {
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm 644 bash $pkgdir/usr/share/bash-completion/completions/pyxstitch
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
