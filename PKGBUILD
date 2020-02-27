# Maintainer: RubenKelevra

pkgname=python-ipfs-api-mount
_pkgname=ipfs-api-mount
pkgver=0.2.0
pkgrel=1
pkgdesc="Mount IPFS directory as local FS"
url="https://github.com/SupraSummus/ipfs-api-mount"
depends=('python'
         'flake8'
	 'python-fusepy>=3.0'
         'python-ipfshttpclient>=0.4'
         'python-protobuf>=3.6')
license=('MIT')
arch=('any')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
b2sums=('f18f0492c61a75bf32d9db25afedc6597d0e9fd04f417378b5eb9cc2c100849a38feddea1da52a160687ed0749b02210c14d662ed12e9ed85fc07ed2de72dc02')

build() {
    cd $srcdir/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
