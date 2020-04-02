# Maintainer: Greg Brown <greg.brown.00 at outlook dot com>
_name=buildbot-gitea
pkgname=python-${_name}
pkgver=1.2.0
pkgrel=1
epoch=
pkgdesc="Buildbot plugin for integration with Gitea."
arch=('any')
url="https://github.com/lab132/buildbot-gitea"
license=('MIT')
groups=()
depends=('buildbot')
makedepends=('python-setuptools')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/lab132/$_name/archive/v$pkgver.tar.gz")
noextract=()
md5sums=('6cdae14b97bd2c65297af41aa42b8b74')
validpgpkeys=()

build() {
	cd "$_name-$pkgver"
  python setup.py build
}

package() {
	cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
