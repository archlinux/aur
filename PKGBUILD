# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>

_name=newspaper3k
pkgname=python-newspaper
pkgdesc='Article scraping & curation'
pkgver=0.2.8
pkgrel=2
url="https://github.com/codelucas/newspaper"
arch=('any')
license=('BSD')
depends=(
	'python-beautifulsoup4>=4.4.1'
	'python-cssselect>=0.9.2'
	## MISSING python-feedfinder2>=0.0.4
	'python-feedparser>=5.2.1'
	'python-jieba>=0.35.1'
	'python-lxml>=3.6.0'
	'python-nltk>=3.2.1'
	## MISSING python-pythainlp>=1.7.2
	'python-pillow>=3.3.0'
	'python-dateutil>=2.5.3'
	'python-yaml>=3.11'
	'python-requests>=2.10.0'
	## MISSING python-tinysegmenter==0.3
	'python-tldextract>=2.0.1')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('b45f4077edd33d9feca16c6f5935d2339f43fda6ac95bc79f9c693f801c266de600d54a8cd9754fadd7170d6fe1ee3ae9501bde30c25b68a42c581aaf28fd01c')

build() {
	cd "${_name}-${pkgver}"
	python setup.py build
}

package() {
	cd "${_name}-${pkgver}"
	python setup.py install -O1 --root="${pkgdir}" --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
