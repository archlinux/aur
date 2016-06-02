# Maintainer: nixi <nixiawoo@gmail.com>
# Contributor: HER0_01 <aconrad103 at gmail.com>

pkgname=senseictl-git
pkgver=r38.9206592
pkgrel=1
pkgdesc="SteelSeries Sensei Raw configuration tool"
arch=('any')
url="https://github.com/dneto/senseictl"
license=('GPL3')
depends=('python' 'python-ioctl-opt-git' 'python-pyudev' 'python-webcolors' 'python-hidraw-git' 'python-yaml')
makedepends=('python-setuptools')
provides=('senseictl')
conflicts=('senseictl')
source=("$pkgname::git://github.com/dneto/senseictl.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
   cd "$srcdir/$pkgname"
   python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
