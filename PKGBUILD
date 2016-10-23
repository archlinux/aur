# Maintainer: ghostbuster <aur@sieverdingbeck.com>
_pkgname=Nagstamon
pkgname=nagstamon
pkgver=2.0.1
pkgrel=1
pkgdesc="Nagios status monitor for the desktop"
depends=('python-pyqt5' 'qt5-multimedia' 'qt5-svg' 'python-requests' 'python-beautifulsoup4' 'python-keyring' 'python-psutil')
arch=('any')
url="https://nagstamon.ifw-dresden.de/"
license=('GPL')
source=(
        "https://nagstamon.ifw-dresden.de/files/stable/$_pkgname-$pkgver.tar.gz"
)
md5sums=(
        '2e969226a45764369d9e7839ecd20a67'
)
sha256sums=(
        '3d4b22190d47250b175a4a70b12391c694ba2399832320887e5909e1ce3dfd7b'
)

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --prefix=/usr --root="$pkgdir"
  mv $pkgdir/usr/bin/nagstamon.py $pkgdir/usr/bin/nagstamon
}

