# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
_name=labml_app
pkgname=python-labml-app
pkgver=0.5.14
pkgrel=1
pkgdesc="Mobile first web app to monitor PyTorch & TensorFlow model training"
url="https://github.com/labmlai/labml"
arch=('any')
provides=('python-labml-app')
depends=('python-labml' 'gunicorn' 'python-numpy' 'python-labml-db' 'python-fastapi' 'uvicorn' 'python-aiofiles')
makedepends=('python-setuptools')
_commit="fa14bec9322f6354235fedee43aca8493fb30952"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/labmlai/labml/$_commit/app/readme.md")
sha256sums=('712575114c944ee4a47dc8cb88b9ccd3cc127d469e616bc5abba6b4f1e170922'
            'da92fbaf6b33b6336a5a49ab839a8022c42817b00403e3d5e9e12755480308db')

build() {
  cd "$srcdir/$_name-$pkgver"
  cp ../readme.md .
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
