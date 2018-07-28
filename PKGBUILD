# Maintainer: Håvard Pettersson <mail@haavard.me>

_pkgname=matplotlib-label-lines
pkgbase=python-$_pkgname
pkgname=(python-$_pkgname python2-$_pkgname)
pkgver=0.3.4
pkgrel=1
pkgdesc='Label lines with matplotlib.'
url='https://github.com/cphyc/matplotlib-label-lines'
arch=(any)
license=(MIT)
depends=(python-matplotlib python-numpy)
makedepends=(python-setuptools python2-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('af8b8f00bedf25ce081698ac5b91342fe3cba821ab33466848a7ab411230d178')

prepare() {
  cp -a $_pkgname-$pkgver $_pkgname-$pkgver-2
}

build_python-matplotlib-label-lines() {
  cd $_pkgname-$pkgver
  python setup.py build
}

build_python2-matplotlib-label-lines() {
  cd $_pkgname-$pkgver-2
  python2 setup.py build
}

package_python-matplotlib-label-lines() {
  cd $_pkgname-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-matplotlib-label-lines() {
  depends=(python2-matplotlib python2-numpy)

  cd $_pkgname-$pkgver-2
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
