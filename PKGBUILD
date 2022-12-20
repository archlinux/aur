# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
_name=labml_app
pkgname=python-labml-app
pkgver=0.0.102
pkgrel=1
pkgdesc="Mobile first web app to monitor PyTorch & TensorFlow model training"
url="https://github.com/labmlai/labml"
arch=('any')
provides=('python-labml-app')
depends=('python-labml' 'gunicorn' 'python-numpy' 'python-labml-db' 'python-fastapi' 'uvicorn' 'python-aiofiles')
makedepends=('python-setuptools')
_commit="35abd82370a772089aeecdbe4be59df38ae380b5"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/labmlai/labml/$_commit/app/readme.md")
sha256sums=('1523243923be100d98af8c91bf3d236c7f8277764424793193e2e874d42e1886'
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
