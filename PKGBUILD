# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>
pkgname=socos
pkgver=0.2
pkgrel=6
pkgdesc="Commandline tool for controlling Sonos devices"
arch=('any')
url="https://github.com/SoCo/socos"
license=('MIT')
depends=('python' 'python-setuptools' 'python-soco')
options=(!emptydirs)
source=("https://github.com/SoCo/socos/archive/v$pkgver.tar.gz")
md5sums=('2d1cf8651a2c9d3d5b895d95706947ad')

prepare() {
  cd "$srcdir/socos-$pkgver"
  sed -i requirements.txt -e "s/soco==0.11.1/soco>=0.11.1/"
}

package() {
  cd "$srcdir/socos-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
