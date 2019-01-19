# Maintainer: John Downey <jdowney@gmail.com>
pkgname=nsscache
pkgver=0.37
pkgrel=1
epoch=
pkgdesc="Asynchronously synchronise local NSS databases with remote directory services"
arch=("x86_64")
url="https://github.com/google/nsscache"
license=("GPL")
groups=()
depends=("python2" "python2-pycurl" "python2-ldap")
makedepends=()
checkdepends=()
optdepends=("python2-boto3")
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/google/nsscache/archive/version/0.37.tar.gz" "nsscache-fix-config-path.patch")
noextract=()
sha256sums=("fab735cabb6ea6e46ce2c52e2c9ea9c2938057fa9e3992b3509f31cf5948fff4" "1212644452638f75fc6a3ea16c7eb8209d93ba608c9dc34e898fafd3df0630a9")
validpgpkeys=()

prepare() {
  patch -Np1 -i "${srcdir}/nsscache-fix-config-path.patch"
}

build() {
  cd "$pkgname-version-$pkgver"
  python2 setup.py build
}

package() {
  cd "$pkgname-version-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
