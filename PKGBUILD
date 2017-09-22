# Maintainer: ghostbuster <aur@sieverdingbeck.com>
_pkgname=Nagstamon
_pkgver='3.1-20170922'
pkgname=nagstamon-beta
pkgver='3.1.0.20170922'
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
        'fd4abcf3518a5ed2d00010472577695b'
)
sha256sums=(
        '51d6dea5f83048d666c4a833cd97d10cdbd3c221e4d1f4119704199bbe70b691'
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

