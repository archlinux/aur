# Maintainer: nixi <nixiawoo@gmail.com>

pkgname=rivalctl-git
pkgver=r12.f175076
pkgrel=2
pkgdesc="SteelSeries Rival configuration tool"
arch=('any')
url="https://github.com/andrepl/rivalctl"
license=('GPL2')
depends=('python2' 'python2-setuptools' 'python2-ioctl-opt-git' 'python2-pyudev' 'python2-webcolors' 'python-hidraw-git' 'python2-yaml')
source=('git+https://github.com/andrepl/rivalctl.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/rivalctl"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd "$srcdir/rivalctl"
   python2 setup.py install --root="$pkgdir/" --optimize=1
}