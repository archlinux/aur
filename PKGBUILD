# Maintainer: Jelle van der Waa <jelle@archlinux.org>

_name=newspaper3k
pkgname=python-newspaper
pkgdesc='Article scraping & curation'
pkgver=0.2.8
pkgrel=1
url="https://github.com/codelucas/newspaper"
arch=(any)
license=(BSD)
makedepends=(python-pytest)
depends=(python python-lxml python-docopt python-chardet python-tldextract)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha512sums=('b45f4077edd33d9feca16c6f5935d2339f43fda6ac95bc79f9c693f801c266de600d54a8cd9754fadd7170d6fe1ee3ae9501bde30c25b68a42c581aaf28fd01c')

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}

check() {
  cd ${_name}-${pkgver}
}

package() {
  cd ${_name}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --skip-build
}
