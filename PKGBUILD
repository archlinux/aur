# Maintainer: ghostbuster <aur@sieverdingbeck.com>
_pkgname=Nagstamon
_pkgver=2.0-beta-20160729
pkgname=nagstamon-beta
pkgver=2.0_b20160729
pkgrel=1
pkgdesc="Nagios status monitor for the desktop"
depends=('python-pyqt5' 'qt5-multimedia' 'python-requests' 'python-beautifulsoup4' 'python-keyring' 'python-psutil')
arch=('any')
url="https://nagstamon.ifw-dresden.de/nagstamon-20/"
license=('GPL')
conflicts=('nagstamon')
provides=('nagstamon')
source=(
        "https://nagstamon.ifw-dresden.de/files-nagstamon/unstable/$_pkgname-$_pkgver.tar.gz"
)
md5sums=(
        'a8c31ea44da7af58b06f64f91b0da57e'
)
sha256sums=(
        '47b1cef3ae1b77f8c3114e8360a46a2788d50b12ef90c8e07f9706045da57144'
)

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --prefix=/usr --root="$pkgdir"
  mv $pkgdir/usr/bin/nagstamon.py $pkgdir/usr/bin/nagstamon
}

