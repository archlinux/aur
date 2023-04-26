# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=django-rest-framework-guardian
pkgname=python-django-rest-framework-guardian
pkgver=0.5.0
pkgrel=1
pkgdesc="django-guardian support for Django REST Framework"
arch=('any')
url="https://github.com/johnthagen/django-rest-framework-guardian2"
license=('BSD3')
depends=('python'
        'python-django'
        'python-django-rest-framework')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/johnthagen/django-rest-framework-guardian2/archive/v$pkgver.tar.gz")
sha256sums=('cda67dc97d3caf743e9338340f11fef1360765d12f8434ec257077efa42893b2')

build() {
  cd "${_pkgname}2-$pkgver" || exit
  python setup.py build
}

package() {
  cd "${_pkgname}2-$pkgver" || exit

  export PYTHONHASHSEED=0
  python setup.py install --skip-build \
      --optimize=1 \
      --prefix=/usr \
      --root="$pkgdir"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
