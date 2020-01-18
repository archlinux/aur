# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-gym-jsbsim-git
pkgver=r241.02b1882
pkgrel=1
pkgdesc='A reinforcement learning environment for aircraft control using the
JSBSim flight dynamics model'
arch=('x86_64')
url='https://github.com/Gor-Ren/gym-jsbsim'
license=('MIT')
depends=('python' 'python-jsbsim' 'python-gym' 'python-numpy'
         'python-matplotlib')
optdepends=('flightgear')
makedepends=('python' 'python-setuptools')
conflicts=('python-gym-jsbsim')
provides=('python-gym-jsbsim')
source=("git+https://github.com/Gor-Ren/gym-jsbsim")
sha256sums=('SKIP')

_pkgname=gym-jsbsim

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
