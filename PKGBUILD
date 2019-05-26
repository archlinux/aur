# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: cosven <yinshaowen241@gmail.com>
pkgname=fuo-qqmusic
pkgver=0.1.3
pkgrel=1
pkgdesc="FeelUOwn plugin for playing music from QQ yinyue"
arch=('any')
url="https://github.com/feeluown/feeluown-qqmusic"
license=('GPL3')
depends=('feeluown' 'python-requests' 'python-marshmallow')
makedepends=('python-setuptools' 'python-pip')
_name=${pkgname#python-}
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name/-/_}-$pkgver.tar.gz"
)
sha256sums=("d3dc8448eefe9f37de9130ca46811ea3dded8b6b4c33013a0528b0866e59fbb4")

build() {
    cd "${pkgname/-/_}-$pkgver"
    python setup.py build
}

package() {
    cd "${pkgname/-/_}-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
