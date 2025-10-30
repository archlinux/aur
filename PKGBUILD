# Contributor: Lucki <https://aur.archlinux.org/account/Lucki>
# Contributor: amo <https://aur.archlinux.org/account/amo>

_pkgname=django-tag-parser
pkgname=python-django-tag-parser
pkgver=3.2
pkgrel=2
pkgdesc="Micro-library to easily write custom Django template tags"
arch=('any')
url="https://github.com/edoburu/django-tag-parser"
license=('Apache')
depends=('python-django')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/edoburu/django-tag-parser/archive/v$pkgver.tar.gz")
sha512sums=('ab39dcf847b1da473ded83655bd8ba7a6e376de68668cd9dc7b2019d8666864ed5665ab162f4a7df56cb7a3eb32e83c8fad3fdecf5774140effc643853997879')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$_pkgname-$pkgver"
  python runtests.py
}

package() {
  cd "$_pkgname-$pkgver"

  export PYTHONHASHSEED=0
  python setup.py install --skip-build \
      --optimize=1 \
      --prefix=/usr \
      --root="$pkgdir"
}
