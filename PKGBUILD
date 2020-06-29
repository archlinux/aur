# Maintainer: Max Gautier <ashelia1000 at gmail dot com>
pkgname=oauth2token
pkgver=0.0.2.post1
pkgrel=1
pkgdesc="Simple cli utility to create and use oauth2 tokens"
arch=(any)
url="https://pypi.org/project/$pkgname/"
install=
install=
license=('GPL')
depends=(python-google-auth-oauthlib python-pyxdg)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('e2f6ea385d80e885431f0a8385c629020b2ea5dbe20b3356260b658841c64de3966511ee17a7b0c6e3ac86c2a279fd1dea83ce89be961dcda4c5f34e5c152f23')

build() {
	cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
