# Maintainer: ghostbuster <aur@sieverdingbeck.com>
_pkgname=Nagstamon
_pkgver='3.1-20170927'
pkgname=nagstamon-beta
pkgver='3.1.0.20170927'
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
        '3d1c0ebe2a8a0b596d5a2e73363d748d'
)
sha256sums=(
        '17a37ba7b4dfad06b570f7325702f5930b3f561d02570cf83b76ad4dd80d6619'
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

