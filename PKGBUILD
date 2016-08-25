# Maintainer: ghostbuster <aur@sieverdingbeck.com>
_pkgname=Nagstamon
_pkgver=2.0-beta-20160825
pkgname=nagstamon-beta
pkgver=2.0_b20160825
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
        '6c2500f7f52e17d5c838c1b2764323e2'
)
sha256sums=(
        'b347ecd87a3273c134e35e21923f7ff0863c39a57239c3ade60c792b1871124a'
)

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --prefix=/usr --root="$pkgdir"
  mv $pkgdir/usr/bin/nagstamon.py $pkgdir/usr/bin/nagstamon
}

