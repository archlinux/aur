# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
_name=labml_app
pkgname=python-labml-app
pkgver=0.0.10
pkgrel=1
pkgdesc="Mobile first web app to monitor PyTorch & TensorFlow model training"
url="https://github.com/labmlai/labml"
arch=('any')
provides=('python-labml-app')
depends=('python-labml' 'gunicorn' 'python-numpy' 'python-labml-db' 'python-fastapi' 'uvicorn' 'python-aiofiles')
makedepends=('python-setuptools')
_commit="9b51c8494b4e9ef008cf30f85d626fee3a3028bf"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/labmlai/labml/$_commit/app/readme.md")
sha256sums=('88306bfcaaa18de9f37777f5056ac46478d2ab160de100d2dabf99cce9f641ce'
            '9f951aa55b4f0a70b1416e2f89eef3548cdef9f3de212c51c378bafe1fcbe7e4')

build() {
  cd "$srcdir/$_name-$pkgver"
  cp ../readme.md .
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
