# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=termdown
pkgver=1.13.0
pkgrel=1
pkgdesc='Countdown timer and stopwatch in your terminal'
arch=('any')
url=https://github.com/trehn/termdown
license=('GPL3')
depends=('python-click' 'python-dateutil' 'python-pyfiglet')
makedepends=('python-setuptools')
optdepends=('espeak: for spoken countdown')
source=("https://files.pythonhosted.org/packages/source/t/termdown/termdown-$pkgver.tar.gz")
sha512sums=('96bb6c88be21cc83077162211f274e9214d9df17b9436f1781b5c872651cdb18e9893e1b822188177b04e88e7ec2de58e49f03a7312155aec5814f4c8f565b43')

build() {
  cd termdown-$pkgver
  python setup.py build
}

package() {
  cd termdown-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
