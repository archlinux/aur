# Maintainer: ghostbuster <aur@sieverdingbeck.com>
_pkgname=nagstamon
_pkgver='2.1.post20170323'
_pkgrel='1'
pkgname=nagstamon-beta
pkgver='2.1.20170323'
pkgrel=1
pkgdesc="Nagios status monitor for the desktop"
depends=('python-pyqt5' 'qt5-multimedia' 'qt5-svg' 'python-requests' 'python-beautifulsoup4' 'python-keyring' 'python-psutil' 'python-requests-kerberos')
arch=('any')
url="https://nagstamon.ifw-dresden.de/"
license=('GPL')
conflicts=('nagstamon')
provides=('nagstamon')
source=(
        "https://nagstamon.ifw-dresden.de/files/unstable/$_pkgname-$_pkgver-$_pkgrel.src.rpm"
)
md5sums=(
        '3542e24e7771e03016a361a0baead1ef'
)
sha256sums=(
        'd8ecdcd2acfdbf3aca11844493d88a395c990adee80e63f253584f89a573fa68'
)

prepare() {
  cd "$srcdir/"
  tar -xzf "$_pkgname-$_pkgver.tar.gz"
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

