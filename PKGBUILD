# Maintainer: ghostbuster <aur@sieverdingbeck.com>
_pkgname=nagstamon
_pkgver='2.1.post20161102'
_pkgrel='1'
pkgname=nagstamon-beta
pkgver='2.1.20161102'
pkgrel=1
pkgdesc="Nagios status monitor for the desktop"
depends=('python-pyqt5' 'qt5-multimedia' 'qt5-svg' 'python-requests' 'python-beautifulsoup4' 'python-keyring' 'python-psutil')
arch=('any')
url="https://nagstamon.ifw-dresden.de/"
license=('GPL')
conflicts=('nagstamon')
provides=('nagstamon')
source=(
        "https://nagstamon.ifw-dresden.de/files/unstable/$_pkgname-$_pkgver-$_pkgrel.src.rpm"
)
md5sums=(
        'b49c4350b864d9239a50b999031e70a9'
)
sha256sums=(
        '2856aef3d95842a0838b5e9974f99940881710247b50afafe5431cbbdb73ce2a'
)

prepare() {
  cd "$srcdir/"
  tar -xzf "$_pkgname-$_pkgver.tar.gz"
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

