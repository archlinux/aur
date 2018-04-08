# Maintainer: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=python-bjoern
_name=bjoern
pkgver=2.2.0
pkgrel=1
pkgdesc="A screamingly fast, ultra-lightweight WSGI server for Python, written in C."
arch=(x86_64)
url="https://github.com/jonashaag/bjoern"
license=('BSD')
depends=('libev' 'python')
makedepends=('python-setuptools')
#source=("https://github.com/jonashaag/bjoern/archive/$pkgver.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

md5sums=('309c2837b01e59afc05c6da34a95709f')

build() {
  cd "$srcdir/$_name-$pkgver"
  python3 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python3 setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
