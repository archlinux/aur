# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=qbittorrent-api
pkgname="python-$_pkgname"
pkgver=2023.4.47
pkgrel=1
pkgdesc="Python client for qBittorrent v4.1+ Web API"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=('python' 'python-requests' 'python-urllib3' 'python-six')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rmartin16/qbittorrent-api/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b988d09a8bf73c0db8c482f09a9332ae3374846a721e307c73376c5b65ae4cee')
b2sums=('e63cd7a430e4b6c4ef1ce4c6833c0db270687826fd48f445a129e7b71fc3c4c9795c2a87cdc6af834283ddcf6d574ca18ac5a99955d9a9da232009b739abaf5e')

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
