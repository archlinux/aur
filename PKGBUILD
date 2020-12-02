# Contributor: Lucki <https://aur.archlinux.org/account/Lucki>
# shellcheck disable=SC2034,2154,2148
# Maintainer: amo <https://aur.archlinux.org/account/amo>

pkgname=python-mglib
_pkgname=mglib
pkgver=1.2.8
pkgrel=1
pkgdesc="Python Package containing modules shared across all Papermerge Project project"
arch=('any')
url="https://github.com/papermerge/mglib"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/papermerge/mglib/archive/v$pkgver.tar.gz")
sha512sums=('edfdc8d7ef861a055cfeba574e15d024053e8d6da2fc0e9696df0055bb91eb90be255b1570dd6d67697b9bfd1f205baf53e53d51a54c68354c44aed7eea2557f')

build() {
  cd "$_pkgname-$pkgver" || exit
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver" || exit

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
