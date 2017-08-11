# Maintainer: ghostbuster <aur@sieverdingbeck.com>
_pkgname=Nagstamon
_pkgver='2.1-20170811'
pkgname=nagstamon-beta
pkgver='2.1.20170811'
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
        'f2c615bfaee88d0a84e4a5117dfd259c'
)
sha256sums=(
        'f9f0368abe3362858cf0a2ac4daa2c1b7c48ac08e2f86a6179b15156b7d305e0'
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

