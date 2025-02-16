# Maintainer: Evan Edwards <evan@ejedev.com>

pkgname=python-baddns
pkgver=1.7.86
pkgrel=1
pkgdesc="Check subdomains for subdomain takeovers and other DNS tomfoolery"
url="https://github.com/blacklanternsecurity/cloudcheck"
license=('GPL-3.0')
arch=('any')
depends=('python' 'python-pyyaml' 'python-dnspython' 'python-colorama' 'python-whois'
        'python-tldextract' 'python-dateutil' 'python-httpx')
makedepends=('python-poetry' 'python-installer')
source=("https://files.pythonhosted.org/packages/52/99/d2dbe76ab221c4605f83d64da83ed0a54f1e0ecdbe9e29b4e0fa8b6540c5/baddns-1.7.86.tar.gz")
sha256sums=('fb0857461e94594d9a2f3d5dad6bd653b3737c96ee6a47e85587bcf3ea6944a9')

build() {
  cd baddns-$pkgver
  python -m poetry build
}

package() {
  cd baddns-$pkgver
  python -m installer --destdir="$pkgdir" dist/baddns-$pkgver-py3-none-any.whl
}
