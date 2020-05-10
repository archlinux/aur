pkgname=pyinstaller2
_pyname=PyInstaller
pkgver=3.6
pkgrel=2
pkgdesc="An application to convert python scripts into stand-alone binaries"
arch=('any')
url="http://www.pyinstaller.org"
license=('GPL')
depends=('python2-setuptools' 'python2-altgraph' 'python2-dis3')
optdepends=(
  'upx: executable compression support'
)
source=(
  "https://github.com/pyinstaller/pyinstaller/releases/download/v${pkgver}/${_pyname}-${pkgver}.tar.gz"
)
sha256sums=(
  '3730fa80d088f8bb7084d32480eb87cbb4ddb64123363763cf8f2a1378c1c4b7'
)
options=('!strip')

package() {
    cd "${srcdir}/${_pyname}-${pkgver}"

    sed -i -e 's_pyi-\(.* = \)_pyi2-\1_g' \
        -e 's_pyinstaller\(.* = \)_pyinstaller2\1_g' setup.py

    python2 setup.py install --root "${pkgdir}" --optimize=1
}
