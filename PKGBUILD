# Maintainer: Alexander Fasching <fasching.a91@gmail.com>
# Contributor: brent s. <bts[at]square-r00t[dot]net>
# Bugreports can be filed at https://github.com/alexf91/AUR-PKGBUILDs

pkgname='python-grpcio-tools'
pkgver=1.34.0
pkgrel=1
pkgdesc="Python protobuf generator for GRPC"
arch=('x86_64' 'i686')
url="https://grpc.io/"
license=('Apache' )
_pkgname=grpcio-tools
install=
changelog=
noextract=()
depends=('python' 'python-grpcio' 'python-protobuf')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/g/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('fc54a71de5026978b20b69d32b5e38df9e54609cf66b73fedbe0af7b46c8b25da74eb3cffd831335aba23e3e05534b945da52bbab9eaf0e8de13a5ec0fc1db04')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set sw=2 et:
