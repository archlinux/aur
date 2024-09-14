# Maintainer: Adam Weld <weld@valvesoftware.com>
# Maintainer: Christian Marcheselli <christianm@valvesoftware.com>

pkgname=jupiter-fan-control
_srctag=20240523.3
pkgver=${_srctag//-/.}
pkgrel=2
arch=('any')
license=('MIT')
pkgdesc="Jupiter fan controller"
url='https://gitlab.com/evlaV/jupiter-fan-control/-/tree/$_srctag'
depends=('python-pyaml' 'python>=3.11')
sha512sums=(SKIP)
makedepends=('git' 'rsync')

source=("git+https://gitlab.com/evlaV/jupiter-fan-control.git#tag=$_srctag")

package() {
   rsync -a --exclude 'README.md' "$srcdir"/jupiter-fan-control/* "$pkgdir"
   sed -i 's/"""Calculates PID value for given reference feedback/r"""Calculates PID value for given reference feedback/' $pkgdir/usr/share/jupiter-fan-control/PID.py
}
