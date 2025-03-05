# Maintainer: Evan Edwards <evan@ejedev.com>

pkgname=python-baddns
pkgver=1.8.108
pkgrel=1
pkgdesc="Check subdomains for subdomain takeovers and other DNS tomfoolery"
url="https://github.com/blacklanternsecurity/baddns"
license=('GPL-3.0-only')
arch=('any')
depends=('python' 'python-pyyaml' 'python-dnspython' 'python-colorama' 'python-whois'
        'python-tldextract' 'python-dateutil' 'python-httpx')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-poetry-dynamic-versioning')
source=("https://files.pythonhosted.org/packages/1c/ab/ea74a5f0fd8d41a592ba2270422653f4cec177b75de147e50c282011403a/baddns-1.8.108.tar.gz")
sha256sums=('47071dc09dde947b3f3145e1ba346b1deab5dd017f884216cab802565ce8abd8')

build() {
  cd baddns-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd baddns-$pkgver
  python -m installer --destdir="$pkgdir" dist/baddns-$pkgver-py3-none-any.whl
}
