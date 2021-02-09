# Maintainer: John Downey <jdowney@gmail.com>
pkgname=nsscache
pkgver=0.41
pkgrel=1
epoch=
pkgdesc="Asynchronously synchronise local NSS databases with remote directory services"
arch=("x86_64")
url="https://github.com/google/nsscache"
license=("GPL")
groups=()
depends=("python" "python-bsddb" "python-pycurl" "python-ldap")
makedepends=()
checkdepends=()
optdepends=("python-boto3: Fetch source data from S3")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/google/nsscache/archive/version/${pkgver}.tar.gz")
noextract=()
sha256sums=('bb022e0a8e9c5c29368dc24a6af40c2b4b2da1fd87618976700e0e6f124c295a')
validpgpkeys=()

build() {
  cd "$pkgname-version-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-version-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
