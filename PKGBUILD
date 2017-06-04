# Maintainer: Adam Hose <adis@blad.is>

pkgname=python-iptables-git
pkgver=r486.d1de82d
pkgrel=1
pkgdesc='Python bindings for iptables'
arch=('x86_64' 'i686')
url='https://github.com/ldx/python-iptables'
license=('Apache')
groups=()
depends=('python' 'iptables')
makedepends=('python-setuptools')
provides=('python-iptables')
conflicts=('python-iptables')
replaces=()
backup=()
options=(!emptydirs)
source=($pkgname::git+https://github.com/ldx/${pkgname%-git}.git)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

check() {
  cd $pkgname
  python setup.py check
}

package() {
  cd $pkgname
  python setup.py install --root="${pkgdir}" --optimize=1
}
