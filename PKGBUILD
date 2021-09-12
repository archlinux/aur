# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=python-abjad-ext-rmakers
pkgver=3.4
pkgrel=1
pkgdesc='Abjad rhythm-maker extension'
arch=('any')
url="https://github.com/abjad/abjad-ext-rmakers"
license=('MIT')
groups=('abjad')
depends=('python-abjad')
makedepends=('python-setuptools' 'git')
source=("$pkgname-$pkgver::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('EF80D3D6F5926FC997919D6A27A5BE0A6ADE7F36')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}


package() {
	cd "$pkgname-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
