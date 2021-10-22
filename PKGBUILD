# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

pkgname=python-survey
pkgver=3.4.3
pkgrel=1
pkgdesc='A simple library for creating beautiful interactive prompts.'
arch=('any')
url="https://github.com/Exahilosys/survey"
license=('MIT')
depends=('python-wrapio>=1.0.0')
makedepends=('python-setuptools')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e896621d01dae3b8e8e64819de1f34c885ff4e78005dd88053c04c490a5adb1c')

build() {
	cd "survey-$pkgver"
	python setup.py build
}

package() {
	cd "survey-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
