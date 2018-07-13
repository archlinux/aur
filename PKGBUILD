# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=snuggs
pkgname=('python2-snuggs')
pkgver=1.4.2
pkgrel=1
pkgdesc="Provide s-expressions for Numpy, for Python 2.7"
arch=('any')
url='https://github.com/mapbox/snuggs'
license=('MIT')
makedepends=('python2-setuptools')
depends=('python2-click' 'python2-numpy' 'python2-pyparsing')
options=(!emptydirs)
sha256sums=('8d56182fc83e1a1893284f69abd35751ce30e8f0a33794c2802e7e5d6547e1f1'
            '29460627842ca33c406297d8b9b2805d8faeb22de7a145358509533b4eca4599')
_pypi='https://files.pythonhosted.org/packages'
_path='07/d9/284b51b951fe2d56266be31f2d5c788b5e8251fdafe5121721d9d36940e1'
source=("$_pypi/$_path/$_name-$pkgver.tar.gz"
  "https://raw.githubusercontent.com/mapbox/$_name/$pkgver/LICENSE")

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
