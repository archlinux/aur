# Maintainer: Evan Edwards <evan@ejedev.com>

pkgname=python-baddns
pkgver=1.9.132
pkgrel=1
pkgdesc="Check subdomains for subdomain takeovers and other DNS tomfoolery"
url="https://github.com/blacklanternsecurity/baddns"
license=('GPL-3.0-only')
arch=('any')
depends=('python' 'python-pyyaml' 'python-dnspython' 'python-colorama' 'python-whois'
        'python-tldextract' 'python-dateutil' 'python-httpx')
makedepends=('python-poetry-core' 'python-build' 'python-installer' 'python-poetry-dynamic-versioning')
source=("https://files.pythonhosted.org/packages/7c/30/b193668dc19374b22962d9358853fa601131e0503356315f880624eb5134/baddns-1.9.132.tar.gz")
sha256sums=('64bbafe0a6c2f9c226323f499aa1b7447d9828eb75908b75b4d389171165cdda')

build() {
  cd baddns-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd baddns-$pkgver
  python -m installer --destdir="$pkgdir" dist/baddns-$pkgver-py3-none-any.whl
}
