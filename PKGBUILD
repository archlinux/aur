# Maintainer: John Downey <jdowney@gmail.com>
pkgname=nsscache
pkgver=0.43
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
sha256sums=('89568f8fe29972ad3d8ffec06b2e5889e5e60ce2f9663002b961613195a22184')
validpgpkeys=()

build() {
  cd "$pkgname-version-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-version-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
