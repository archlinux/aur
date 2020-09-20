# Maintainer: John Downey <jdowney@gmail.com>
pkgname=nsscache
pkgver=0.39
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
sha256sums=("3eb0b2a4c163d2c2fd3748e23fc6296f253d9be0a74a1fe9c0fe3191f4c2638d")
validpgpkeys=()

build() {
  cd "$pkgname-version-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-version-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
