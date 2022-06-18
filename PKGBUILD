# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname=certbot-dns-freenom
pkgver=1.3.4
pkgrel=1
pkgdesc="Freenom DNS Authenticator plugin for Certbot"
arch=('any')
url="https://github.com/Shm013/certbot-dns-freenom"
license=('Apache')
depends=('python' 'python-freenom' 'python-zope-interface')
makedepends=('python-setuptools')
conflicts=('python-certbot-dns-freenom')
provides=('python-certbot-dns-freenom')
source=("https://github.com/Shm013/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2f6497017e8f5671827b2eb649d229129f2fa155d0ea2da2452140a93ed48e3f')

build() {
	cd $pkgname-$pkgver
	python setup.py build
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
