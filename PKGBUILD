# Maintainer: Evangelos Foutras <foutrelis@gmail.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python-virtualenvwrapper
pkgver=2.6
pkgrel=1
pkgdesc="Extensions to Ian Bicking's virtualenv tool"
arch=('any')
url="http://www.doughellmann.com/projects/virtualenvwrapper/"
license=('BSD')
depends=('python-virtualenv')
source=(http://www.doughellmann.com/downloads/virtualenvwrapper-$pkgver.tar.gz)
md5sums=('59905555df12e307e4c9f1174ffcb2f2')

build() {
  cd "$srcdir/virtualenvwrapper-$pkgver"

  python2 setup.py install --root="$pkgdir" -O1

  # Use Python 2
  sed -i 's/which python/\02/' "$pkgdir/usr/bin/virtualenvwrapper.sh"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  # Extract the license from README.txt
  sed -n '/Copyright/,$ p' README.txt \
    >"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
