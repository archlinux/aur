# Maintainer: Evan Edwards <evan@ejedev.com>

pkgname=python-baddns
pkgver=1.9.130
pkgrel=1
pkgdesc="Check subdomains for subdomain takeovers and other DNS tomfoolery"
url="https://github.com/blacklanternsecurity/baddns"
license=('GPL-3.0-only')
arch=('any')
depends=('python' 'python-pyyaml' 'python-dnspython' 'python-colorama' 'python-whois'
        'python-tldextract' 'python-dateutil' 'python-httpx')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-poetry-dynamic-versioning')
source=("https://files.pythonhosted.org/packages/6e/43/bcbaf0bf94522967d6dda72eed31b530b1a3b5b7b7252bb37215a2bd0c10/baddns-1.9.130.tar.gz")
sha256sums=('d983fc59d17b1c5c021050f4524796a0c8a3ac1398b2d4ea918a7103f5eaf636')

build() {
  cd baddns-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd baddns-$pkgver
  python -m installer --destdir="$pkgdir" dist/baddns-$pkgver-py3-none-any.whl
}
