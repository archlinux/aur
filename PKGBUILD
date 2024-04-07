# Maintainer: Ellis Kenyo <me at elken dot dev>

pkgname=python-xxh
pkgver=0.8.14
pkgrel=1
pkgdesc="Take your shell with you!"
arch=('x86_64')
url="https://pypi.org/project/xxh-xxh/"
depends=('python' 'python-pexpect' 'python-yaml')
makedepends=("python-build" "python-installer" "python-wheel")
license=('BSD')
source=($pkgname-$pkgver::https://github.com/xxh/xxh/archive/refs/tags/$pkgver.zip)
md5sums=('995183dfecb3fa0cf7a21a238c4fec60')

build() {
  cd "$srcdir"/$(echo $pkgname | cut -d- -f2)-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/$(echo $pkgname | cut -d- -f2)-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
