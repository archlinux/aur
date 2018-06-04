# Maintainer: Cookie Engineer <cookiengineer@protonmail.ch>

pkgname=instagram-scraper
pkgver=1.5.36
pkgrel=1
pkgdesc="Scrapes and downloads an instagram user's photos and videos"
arch=('any')
url=https://github.com/rarcega/instagram-scraper
license=('custom:Public domain')
depends=('python-requests' 'python-tqdm')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('4e3adca3dbb8d0cd8cd4299b7e490cea7814c49156190949c0d6ea8dcfd2222a73fddd3a6a7abab3e8de48318fbe75a2c841291a4219092d605ddc389ea92974')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
