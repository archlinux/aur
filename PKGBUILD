# Contributor: Lucki <https://aur.archlinux.org/account/Lucki>
# shellcheck disable=SC2034,2154,2148
# Maintainer: amo <https://aur.archlinux.org/account/amo>

pkgname=python-mgclipboard
_pkgname=mg-clipboard
pkgver=0.3.0
pkgrel=1
pkgdesc="Clipboard middleware for Papermerge DMS. Designed as Django reusable app."
arch=('any')
url="https://github.com/papermerge/mg-clipboard"
license=('Apache')
depends=('python')
makedepends=('python-setuptools')
_commit="f5a4e9370820c3d8bbfbc3bed08131d32bc141fc"
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/papermerge/mg-clipboard/archive/$_commit.tar.gz")
sha512sums=('25f7787ca3aec9d0f56ddf4dc65a530a39c4238a91040af592b8f5c686f539ddcf734101307aa9ee86f6850825c7eb33ea66e2cfd19c27a96358e755bf1b78a9')

build() {
  cd "$_pkgname-$_commit" || exit
  python setup.py build
}

package() {
  cd "$_pkgname-$_commit" || exit

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
