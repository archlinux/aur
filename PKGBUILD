# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: David Campbell <davekong@archlinux.us>
# Contributor: Cilyan Olowen <gaknar@gmail.com>
# Contributor: Frederik M.J.V. <freqmod VED iskrembilen Dott kom>

pkgbase=python-tempita
pkgname=('python-tempita' 'python2-tempita')
pkgver=0.5.3dev20170202
_commit=47414a7c6e46a9a9afe78f0bce2ea299fa84d10d
pkgrel=4
pkgdesc="A lightweight unicode templating language"
arch=('any')
url="http://pythonpaste.org/tempita/"
license=('custom:MIT')
makedepends=('python-distribute' 'python2-distribute' 'git')
#source=(https://pypi.python.org/packages/source/T/Tempita/Tempita-${pkgver}.tar.gz)
source=("$pkgbase::git://github.com/gjhiggins/tempita.git#commit=${_commit}")
sha256sums=('SKIP')

package_python-tempita() {
  depends=('python')

  cd "$srcdir"/$pkgbase
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-tempita() {
  depends=('python2')

  cd "$srcdir"/$pkgbase
  sed -e 's|from urllib.parse|from urllib|' -i tempita/__init__.py
  python2 setup.py install --root="$pkgdir" --optimize=1
}
