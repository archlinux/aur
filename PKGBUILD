# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Gaël Donval <gdonval+aur at google mail>

pkgbase='python-flask-cors'
pkgname=('python-flask-cors' 'python2-flask-cors')
_name=Flask-Cors
pkgver=3.0.7
pkgrel=2
pkgdesc="A Flask extension for handling Cross Origin Resource Sharing (CORS), making cross-origin AJAX possible"
arch=('any')
url='https://pypi.org/project/Flask-Cors'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('4448765829502d74745a976aa0620c1a')
sha1sums=('4e3b951c6ee56e19396ff8a3ff4534d821434b86')
sha256sums=('7e90bf225fdf163d11b84b59fb17594d0580a16b97ab4e1146b1fb2737c1cfec')

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
