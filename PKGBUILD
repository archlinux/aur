# Maintainer: Adam Weld <weld@valvesoftware.com>
# Maintainer: Christian Marcheselli <christianm@valvesoftware.com>

pkgname=jupiter-fan-control
_srctag=20260422.2
_commit=460e4593d42e826793ceab4abc9047cd7d2425ac
pkgver=${_srctag//-/.}
pkgrel=2
arch=('any')
license=('MIT')
pkgdesc="Jupiter fan controller"
url='https://github.com/evlav/jupiter-fan-control/-/tree/$_srctag'
depends=('python-pyaml' 'python>=3.10')
sha512sums=(SKIP)
makedepends=('git' 'rsync')

source=("git+https://github.com/evlav/jupiter-fan-control.git#commit=$_commit")

package() {
   rsync -a --exclude 'README.md' --exclude 'pyproject.toml' "$srcdir"/jupiter-fan-control/* "$pkgdir"
}
