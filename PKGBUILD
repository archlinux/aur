# Maintainer: ghostbuster <aur@sieverdingbeck.com>
_pkgname=Nagstamon
_pkgver='3.1-20171101'
pkgname=nagstamon-beta
pkgver='3.1.0.20171101'
pkgrel=1
pkgdesc="Nagios status monitor for the desktop"
depends=('python-pyqt5' 'qt5-multimedia' 'qt5-svg' 'python-requests' 'python-beautifulsoup4' 'python-keyring' 'python-psutil' 'python-requests-kerberos' 'python-lxml')
arch=('any')
url="https://nagstamon.ifw-dresden.de/"
license=('GPL')
conflicts=('nagstamon')
provides=('nagstamon')
source=(
        "https://nagstamon.ifw-dresden.de/files/unstable/$_pkgname-$_pkgver.tar.gz"
)
md5sums=(
        'c8435c6e4d29881697e6b4d2dedf4739'
)
sha256sums=(
        'cddae3e8a9c72d953360aa2030d0555e0e06eef4b7e500a6db01275f6754f14e'
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

