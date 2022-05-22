# Maintainer: Lahfa Samy (AkechiShiro) <'akechishiro-aur' at the domain 'lahfa.xyz'>
# Contributor: Daniel Maslowski <info@orangecms.org>

_gitname=PSPTool
_pyname=psptool
pkgname=psptool-git
pkgver=r125.58f5ba2
pkgrel=1
pkgdesc="Swiss Army knife for dealing with firmware of the AMD Secure Processor"
arch=('any')
url="https://github.com/PSPReverse/PSPTool"
license=('GPL3')
depends=(
  'ipython'
  'python'
  'python-cryptography'
  'python-prettytable'
  'python-setuptools'
)
makedepends=('git')
provides=("$_pyname")
conflicts=($_pyname)
options=(!emptydirs)
source=(git+https://github.com/PSPReverse/PSPTool.git)
sha512sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
