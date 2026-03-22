# Maintainer: kmille github@androidloves.me

pkgname=borgctl
pkgver=0.5.2
pkgrel=1
pkgdesc="borgctl - borgbackup without bash scripts"
arch=('any')
url="https://github.com/kmille/borgctl"
license=('GPL-3.0-or-later')
makedepends=(uv python-installer)
depends=(python python-ruamel-yaml)
source=(https://github.com/kmille/borgctl/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('634fef9bf22162eb6e43e4858fe9171514bbd7e1031d52714195478bf506a996')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  uv build --wheel
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
