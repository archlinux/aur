# Maintainer: ghostbuster <aur@sieverdingbeck.com>
_pkgname=Nagstamon
_pkgver=2.0-rc1
pkgname=nagstamon-beta
pkgver=2.0_rc1
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
        'ef4e8ce8349e0258f3dd68c0dbb0453c'
)
sha256sums=(
        '0d4ea2c017008a401f9685dd83457c3122139c5928fe9d91b327e21070a53787'
)

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --prefix=/usr --root="$pkgdir"
  mv $pkgdir/usr/bin/nagstamon.py $pkgdir/usr/bin/nagstamon
}

