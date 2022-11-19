# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Contributor: xantares

pkgname=python38-sphinx-alabaster-theme
pkgver=0.7.12
pkgrel=9

pkgdesc="Sphinx default theme"
url='https://github.com/bitprophet/alabaster'
arch=('any')
license=('custom:BSD')

depends=('python38')
makedepends=('python38-setuptools')

source=("https://pypi.org/packages/source/a/alabaster/alabaster-$pkgver.tar.gz")

sha256sums=('a661d72d58e6ea8a57f7a86e37d86716863ee5e92788398526d58b26a4e4dc02')
b2sums=('5690d9c0b8aabfc2c95c4279183d174d6a5768f89732028f7ec6eb790531499a2017b9f3b9896442e298f3189f79070178b3e281b6d0bcfad3741625caa99c48')

build() {
	cd alabaster-"$pkgver"
	python3.8 setup.py build
}

package() {
	cd alabaster-"$pkgver"
	python3.8 setup.py install --root="$pkgdir" --optimize=1

	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
