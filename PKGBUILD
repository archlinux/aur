# Maintainer: pumpkincheshire <sollyonzou@gmail.com>
# Contributor: tembleking <tembleking at gmail dot com>

pkgname=('python-haversine')
_name=haversine
pkgver=2.3.0
pkgrel=3
pkgdesc="Calculate the distance (in various units) between two points on Earth using their latitude and longitude."
arch=("any")
url="https://github.com/mapado/haversine"
license=('MIT')
depends=()
makedepends=("python-setuptools")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
    "https://raw.githubusercontent.com/mapado/haversine/master/LICENSE")
sha256sums=('72c76855ac25e6ad054c7ed380e95c1a96803185f005dd11f40ccaa9620b551f'
    '4a5b657ce0f6473ace15c292cd7f0d483b4eef1fd8f31c8a4d58c7a8c27eb20f')

# prepare() {
#     cp -r $_name-$pkgver $_name-$pkgver-py2
# }

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build

    # cd "$srcdir/$_name-$pkgver-py2"
    # python2 setup.py build
}

package_python-haversine() {
    depends=("python")
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_name-$pkgver/LICENSE"
}

# package_python2-haversine() {
#     depends=("python2")
#     cd "$srcdir/$_name-$pkgver-py2"
#     python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
#     #    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name-$pkgver/LICENSE"
# }
