# Maintainer: Evangelos Foutras <foutrelis@gmail.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python-virtualenvwrapper
pkgver=2.2.2
pkgrel=1
pkgdesc="Extensions to Ian Bicking's virtualenv tool"
url="http://www.doughellmann.com/projects/virtualenvwrapper/"
arch=('any')
license=('BSD')
depends=('python-virtualenv')
source=(http://www.doughellmann.com/downloads/virtualenvwrapper-$pkgver.tar.gz)
md5sums=('e5324eb7d5bbce7480f8dda5e7dfa125')

build() {
  cd "$srcdir/virtualenvwrapper-$pkgver"
  python setup.py install --root="$pkgdir" -O1
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  # Extract the license from README.txt
  sed -n '/Copyright/,$ p' README.txt \
    >"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
