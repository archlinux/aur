pkgname=python-dottorrent
_pkgname=dottorrent
pkgver=1.9.2
pkgrel=3
arch=('x86_64')
url='https://github.com/kz26/dottorrent'
license=('MIT')
depends=('python-bencoder-pyx')
makedepends=('python-setuptools' 'git')
pkgdesc="High-level Python 3 library for creating .torrent files"
source=("$_pkgname-$pkgver::git+https://github.com/kz26/dottorrent#tag=v$pkgver")
sha256sums=('12e5569832d4d65ac68f0fb8e13ab79f47e12f846b628b28f0b35f0d73ecd172')

build() {
	cd $_pkgname-$pkgver
	python setup.py build
}

package() {
	cd $_pkgname-$pkgver
	python setup.py install --root="$pkgdir"
}
