# Maintainer: Sibren Vasse <arch@sibrenvasse.nl>
# Contributor: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Morten Linderud <morten@linderud.pw>

_name=PyChromecast
pkgname=python-pychromecast
pkgver=2.5.2
pkgrel=1
pkgdesc='Library for Python 3 to communicate with the Google Chromecast'
arch=('any')
url=https://github.com/balloob/pychromecast
license=('MIT')
depends=('python' 'python-protobuf' 'python-requests' 'python-zeroconf' 'python-six' 'python-setuptools' 'python-casttube')
source=("https://files.pythonhosted.org/packages/source/p/pychromecast/$_name-$pkgver.tar.gz")
sha512sums=('8c3183ccdae59ec09d9b0444cdf03d5fed124395b37e0663ed6817e7128f65c5c6eefd70bd9daddeb55ec9312ac3df1995fe8af56d9de5a54e9a1e0214f79d7d')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
