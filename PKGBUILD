# Maintainer: Eli Schwartz <eschwartz93@gmail.com>
# Contributor: Renato Garcia <fgarcia.renato@gmail.com>

pkgname=trash-cli
pkgver=0.12.9.14.r34.g7913a0b
_commit=7913a0b8296b006c942e117dd1e94397110467b7
pkgrel=1
pkgdesc='Command line trashcan (recycle bin) interface'
arch=('any')
url="https://github.com/andreafrancia/${pkgname}"
license=('GPL')
depends=('python2' 'python2-setuptools')
source=("${url}/archive/${_commit}.tar.gz")
sha256sums=('6a2e3d522072c3fdb76ffa1f1067aeda5a551ecf6b3d71f724b82764ecd2d292')

build() {
  cd "${srcdir}/${pkgname}-${_commit}"
  python2 setup.py build
}

package(){
  cd "${srcdir}/${pkgname}-${_commit}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
