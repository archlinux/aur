# Contributor: Lucki <https://aur.archlinux.org/account/Lucki>
# Maintainer: amo <https://aur.archlinux.org/account/amo>

_pkgname=django-tag-parser
pkgname=python-django-tag-parser
pkgver=3.2
pkgrel=1
pkgdesc="Micro-library to easily write custom Django template tags "
arch=('any')
url="https://github.com/edoburu/django-tag-parser"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-django')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/edoburu/django-tag-parser/archive/v$pkgver.tar.gz")
sha512sums=('ab39dcf847b1da473ded83655bd8ba7a6e376de68668cd9dc7b2019d8666864ed5665ab162f4a7df56cb7a3eb32e83c8fad3fdecf5774140effc643853997879')

build() {
  cd "$_pkgname-$pkgver" || exit
  python setup.py build
}

check() {
  cd "$_pkgname-$pkgver" || exit
  python runtests.py
}

package() {
  cd "$_pkgname-$pkgver" || exit

  export PYTHONHASHSEED=0
  python setup.py install --skip-build \
      --optimize=1 \
      --prefix=/usr \
      --root="$pkgdir"
}
