# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: David Campbell <davekong@archlinux.us>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: Frederik M.J.V. <freqmod VED iskrembilen Dott kom>

pkgbase=python-tempita
pkgname=('python-tempita' 'python2-tempita')
pkgver=0.5.2
pkgrel=3
pkgdesc="A lightweight unicode templating language"
arch=('any')
url="http://pythonpaste.org/tempita/"
license=('custom:MIT')
makedepends=('python-distribute' 'python2-distribute')
source=(https://pypi.python.org/packages/source/T/Tempita/Tempita-${pkgver}.tar.gz)
sha256sums=('cacecf0baa674d356641f1d406b8bff1d756d739c46b869a54de515d08e6fc9c')

package_python-tempita() {
  depends=('python')

  cd "$srcdir"/Tempita-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 "$srcdir"/$pkgbase-license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}

package_python2-tempita() {
  depends=('python2')

  cd "$srcdir"/Tempita-${pkgver}
  sed -e 's|from urllib.parse|from urllib|' -i tempita/__init__.py
  python2 setup.py install --root="$pkgdir" --optimize=1
}
