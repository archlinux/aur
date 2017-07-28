# Maintainer: ghostbuster <aur@sieverdingbeck.com>
_pkgname=Nagstamon
_pkgver='2.1-20170727'
pkgname=nagstamon-beta
pkgver='2.1.20170727'
pkgrel=1
pkgdesc="Nagios status monitor for the desktop"
depends=('python-pyqt5' 'qt5-multimedia' 'qt5-svg' 'python-requests' 'python-beautifulsoup4' 'python-keyring' 'python-psutil' 'python-requests-kerberos')
arch=('any')
url="https://nagstamon.ifw-dresden.de/"
license=('GPL')
conflicts=('nagstamon')
provides=('nagstamon')
source=(
        "https://nagstamon.ifw-dresden.de/files/unstable/$_pkgname-$_pkgver.tar.gz"
)
md5sums=(
        '978126600e1526e96cc67add34091b97'
)
sha256sums=(
        'ef50341ee05b10f395cc9d013e3f70a9c8cf73cbc2847f2201d0567f0b0fcd76'
)

prepare() {
  cd "$srcdir/"
  tar -xzf "$_pkgname-$_pkgver.tar.gz"
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --prefix=/usr --root="$pkgdir"
  mv $pkgdir/usr/bin/nagstamon.py $pkgdir/usr/bin/nagstamon
}

