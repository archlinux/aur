# Maintainer: Bruce Cutler <bruce@sumebrius.net>
_pkgname=django-ninja
pkgname=python-django-ninja
pkgver=0.20.0
pkgrel=1
pkgdesc="Fast Django REST Framework"
arch=('any')
url="https://django-ninja.rest-framework.com/"
license=('MIT')
depends=('python-django>=2.2'
         'python-pydantic>=1.6')
makedepends=('python-flit'
             'python-installer')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/vitalik/django-ninja/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('17aad1846e5db8db7320724d47998a332250e5a3af66581dcf91f501ce8a08c2')

build() {
  cd "$_pkgname-$pkgver"

  flit build --format=wheel  
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
