# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Gaël Donval <gdonval+aur at google mail>

pkgbase='python-flask-cors'
pkgname=('python-flask-cors' 'python2-flask-cors')
_name=Flask-Cors
pkgver=3.0.8
pkgrel=1
pkgdesc="A Flask extension for handling Cross Origin Resource Sharing (CORS), making cross-origin AJAX possible"
arch=('any')
url='https://pypi.org/project/Flask-Cors'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('551cc4c0305a171d28caa2b3bc838867')
sha1sums=('63e254d5a2052328ae3d904f475b8fab9c1c5275')
sha256sums=('72170423eb4612f0847318afff8c247b38bd516b7737adfc10d1c2cdbb382d16')

package_python-flask-cors() {
    depends=('python>=3.4' 'python-flask>=0.9' 'python-six')

    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-flask-cors() {
    depends=('python2' 'python2-flask>=0.9' 'python2-six')

    cd "$srcdir/$_name-$pkgver"
    python2 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
    install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
