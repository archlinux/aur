# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python-labml
pkgver=0.4.126
pkgrel=1
pkgdesc="Monitor PyTorch & TensorFlow model training on mobile phones"
url="https://github.com/labmlai/labml"
arch=('any')
provides=('python-labml')
depends=('python' 'python-gitpython' 'python-numpy' 'python-yaml')
makedepends=('python-setuptools')
_name="${pkgname#python-}"
_commit="3e5daa627438c106dcd35280266a0c0876c7c860"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/labmlai/labml/$_commit/readme.md")
sha256sums=('8d61d11ec316b6aa85083880e15b32ef23a411238a9e1b9fb7d3fb7cf7f4e1f3'
            '52ce96a13aa600f28d49644d94a0e3d3223957c642c4878fadc1b6dfe9874b6e')

build() {
  cd "$srcdir/$_name-$pkgver"
  cp ../readme.md .
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
