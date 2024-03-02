# Maintainer: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Hilton Medeiros <medeiros.hilton@gmail.com>

pkgname=python-bjoern
_name=bjoern
pkgver=3.2.2
pkgrel=1
pkgdesc="A screamingly fast, ultra-lightweight WSGI server for Python, written in C."
arch=(x86_64)
url="https://github.com/jonashaag/bjoern"
license=('BSD')
depends=('libev' 'python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('e9f136a57344c1c89dfd6f152ffdb59c')

build() {
  cd "$srcdir/$_name-$pkgver"
  python3 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python3 setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
