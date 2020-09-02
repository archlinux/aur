# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Gaël Donval <gdonval+aur at google mail>

pkgbase='python-flask-cors'
pkgname=('python-flask-cors' 'python2-flask-cors')
_name=Flask-Cors
pkgver=3.0.9
pkgrel=1
pkgdesc="A Flask extension for handling Cross Origin Resource Sharing (CORS), making cross-origin AJAX possible"
arch=('any')
url='https://pypi.org/project/Flask-Cors'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("$pkgbase-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('b271c3c87fce716948f3230a84835d55')
sha1sums=('b00978470024b7124b66c92dd6c08654e9be4fe9')
sha256sums=('6bcfc100288c5d1bcb1dbb854babd59beee622ffd321e444b05f24d6d58466b8')

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
