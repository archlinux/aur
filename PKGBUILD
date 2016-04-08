# Maintainer: nixi <nixiawoo@gmail.com>
# Contributor: HER0_01 <aconrad103 at gmail.com>

pkgname=rivalctl-git
pkgver=r27.0bbf7c3
pkgrel=2
pkgdesc="SteelSeries Rival configuration tool"
arch=('any')
url="https://github.com/nixi-awoo/rivalctl"
license=('GPL3')
depends=('python' 'python-ioctl-opt-git' 'python-pyudev' 'python-webcolors' 'python-hidraw-git' 'python-yaml')
makedepends=('python-setuptools')
provides=('rivalctl')
conflicts=('rivalctl')
source=("$pkgname::git://github.com/nixi-awoo/rivalctl.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd "$srcdir/$pkgname"
   python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
