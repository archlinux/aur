# Maintainer: Maxr1998 <aur@maxr1998.de>

_filename=homeassistant_cli
pkgname=python-homeassistant-cli
pkgver=1.0.0
pkgrel=1
pkgdesc='Command-line tool for Home Assistant'
arch=('any')
url=https://github.com/home-assistant-ecosystem/home-assistant-cli
license=('Apache')
depends=('python' 'python-requests' 'python-netdisco' 'python-click' 'python-click-log' 'python-tabulate' 'python-jsonpath-ng' 'python-jinja' 'python-dateparser' 'python-regex' 'python-ruamel-yaml' 'python-aiohttp' 'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
conflicts=('home-assistant-cli')
source=("https://files.pythonhosted.org/packages/source/h/homeassistant-cli/$_filename-$pkgver.tar.gz")
sha256sums=('de7cc54de6f2a8bdbde3bfea75913f35ee82faa17fe272e840a2da0c93b1a7df')

build() {
  cd $_filename-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_filename-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
