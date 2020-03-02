# Maintainer: RubenKelevra

pkgname=python-ipfs-api-mount
_pkgname=ipfs-api-mount
pkgver=0.2.1pre_c1c4389
pkgrel=1
pkgdesc="Mount IPFS directory as local FS"
url="https://github.com/SupraSummus/ipfs-api-mount"
depends=('python'
         'flake8'
	 'python-fusepy>=3.0'
         'python-ipfshttpclient>=0.4'
         'python-protobuf>=3.6'
	 'python-multibase>=1.0.0')
license=('MIT')
arch=('any')
#source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
source=("${_pkgname}-${pkgver}.tar.gz::https://codeload.github.com/SupraSummus/ipfs-api-mount/zip/c1c4389c4cab737eefa2cf1b34335f36c7c4d1d3")
b2sums=('8179d967280999ab8a1ba2458de7843ce5c7e097e46194646c7a1db2ef0bb13216d3f92d634fc01e3e48f7057ce555b0e41c0dcc030de8d9e84cfcc7109a65d7')

build() {
#    cd $srcdir/${_pkgname}-${pkgver}
    cd $srcdir/ipfs-api-mount-c1c4389c4cab737eefa2cf1b34335f36c7c4d1d3/
    python setup.py build
}

package() {
#    cd $srcdir/${_pkgname}-${pkgver}
    cd $srcdir/ipfs-api-mount-c1c4389c4cab737eefa2cf1b34335f36c7c4d1d3/
    python setup.py install --root="$pkgdir" --optimize=1 
}
