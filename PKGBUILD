# Maintainer: nixi <nixiawoo@gmail.com>

pkgname=rivalctl-git
pkgver=r24.5873121
pkgrel=1
pkgdesc="SteelSeries Rival configuration tool"
arch=('any')
url="https://github.com/pacoqueen/rivalctl"
license=('GPL3')
depends=('python' 'python-ioctl-opt-git' 'python-pyudev' 'python-webcolors' 'python-hidraw-git' 'python-yaml')
makedepends=('python-setuptools')
provides=('rivalctl')
conflicts=('rivalctl')
source=("$pkgname::git://github.com/pacoqueen/rivalctl.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd "$srcdir/$pkgname"
   python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
