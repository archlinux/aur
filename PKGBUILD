# Maintainer: novenary <streetwalkermc@gmail.com>
pkgname=socos
pkgver=0.2.r33.g7719b54
pkgrel=2
pkgdesc="Commandline tool for controlling Sonos devices"
arch=('any')
url="https://github.com/SoCo/socos"
license=('MIT')
depends=('python' 'python-setuptools' 'python-soco')
options=(!emptydirs)
source=("git+https://github.com/SoCo/socos.git#commit=7719b54873235abc068a6bcfbf606e518baeeffc")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/socos"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/socos"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
