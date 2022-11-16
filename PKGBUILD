# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname='python-solc'
_pkgname='py-solc'
pkgver=3.2.0
pkgrel=1
pkgdesc="Python wrapper around the solc Solidity compiler."
arch=('any')
depends=('solidity'
         'python-tox'
         'python-semantic-version'
         'python-bumpversion'
         'twine'
        )

makedepends=('python-setuptools')
url="https://github.com/ethereum/$_pkgname"
license=('MIT')
source=("https://pypi.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('82095bdac661072f48cf2daf8a96bdb625674330d92b225be26043e8d3ef8c9a')

build() {
  cd $_pkgname-$pkgver
  python setup.py build
}

package() {
  cd $_pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
