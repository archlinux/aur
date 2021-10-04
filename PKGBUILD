# Contributor: Lucki <https://aur.archlinux.org/account/Lucki>
# shellcheck disable=SC2034,2154,2148
# Maintainer: amo <https://aur.archlinux.org/account/amo>

pkgname=python-mglib
_pkgname=mglib
pkgver=1.3.1
pkgrel=1
pkgdesc="Python Package containing modules shared across all Papermerge Project project"
arch=('any')
url="https://github.com/papermerge/mglib"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/papermerge/mglib/archive/v$pkgver.tar.gz")
sha256sums=('18c81f63a4d9709f2a3c29afa48a83ac91f5eea2f13f0535d58445cd738be6f0')

build() {
  cd "$_pkgname-$pkgver" || exit
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver" || exit

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
