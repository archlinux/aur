# Maintainer: Marco Kundt <mrckndt@gmail.com>

pkgname=stcgal-git
pkgver=r127.86e289b
pkgrel=1
pkgdesc="Open Source STC MCU ISP flash tool"
arch=('any')
conflicts=('stcgal')
url="https://github.com/grigorig/stcgal"
license=('MIT')
depends=('python-pyserial' 'python-setuptools')
optdepends=('python-pyusb: Native USB programming support')
makedepends=('git')
source=(git+https://github.com/grigorig/stcgal)
md5sums=('SKIP')

_gitname='stcgal'

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${_gitname}
  python setup.py install --root="$pkgdir/" --optimize=1
}

