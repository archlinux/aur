# Maintainer: David Vogt <dave at winged dot ch>
# This PKGBUILD is maintained at https://github.com/winged/aur-packages

pkgname=finja-git
_pkgname=finja-git
pkgver=0.r116.ce7e4dd
pkgrel=1
pkgdesc="Index and find your stuff"
arch=('any')
license=('AGPL')
url='http://github.com/adfinis-sygroup/finja'
depends=('python'
         'python-six'
         'python-binaryornot'
         'python-termcolor'
         )
conflicts=()
provides=('finja' 'finja-git')
makedepends=()
source=("$pkgname::git://github.com/adfinis-sygroup/finja.git"
        "LICENSE::https://www.gnu.org/licenses/agpl.txt")
sha256sums=('SKIP' '57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6')

pkgver() {
  cd "${_pkgname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
