# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-qdarkstyle
pkgver=2.8
pkgrel=1
pkgdesc="A dark stylesheet for Python and Qt applications"
arch=('any')
depends=('python' 'python-helpdev' 'python-pip' 'python-qtpy' 'python-psutil')
makedepends=('python-setuptools')
optdepends=('python-qtsass: develop' 
            'python-watchdog: develop'
            'python-sphinx: docs'
            'python-sphinx_rtd_theme: docs'
            'python-pyqt5: example'
            'python-pyside2: example')
url="https://github.com/ColinDuquesnoy/QDarkStyleSheet"
license=('MIT')
options=('!emptydirs')
source=($pkgname-$pkgver.tar.gz::https://github.com/ColinDuquesnoy/QDarkStyleSheet/archive/v$pkgver.tar.gz)
sha256sums=('8e2f1935763072ba4e18cecbf9159082f931d582cc8b37bc6b1fb417f3519f9b')

build() {
  cd "$srcdir/QDarkStyleSheet-$pkgver"

  msg2 'Building...'
  python setup.py build
}

package() {
  cd "$srcdir/QDarkStyleSheet-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
