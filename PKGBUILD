pkgname=mitogen
pkgver=0.2.2
pkgrel=1
pkgdesc="Distributed self-replicating programs in Python"
license=("BSD")
url="https://mitogen.readthedocs.io/"
depends=('python')
makedepends=('python-setuptools')
optdepends=('ansible: for using the ansible strategy plugin')
source=("https://github.com/dw/mitogen/archive/v${pkgver}.tar.gz")
arch=('any')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('efaed96521a370477f755b139295457d')
sha1sums=('6e812e4059b7314e73a380957980f056c28fae1a')
sha256sums=('f0d0d9906248614bc959de288ad20cb41abd357af58aac7f6584f0506c76b4f7')
sha384sums=('a863e963c18ce96fa81ebc1d9d38d80a7605b565722a72142a093dbf6f89ed5c30119791f50b1b34b1fd6dd00c4c0812')
sha512sums=('df4ec9a61544af5757f00ed5bb8f055ffe329bc1b060ef864ae296522de841b5100080e7a3ee3d0fb90205d4c42b4b85d2e6c952d9deb4cbc70cbfdb504c0e8f')
