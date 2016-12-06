# Maintainer: ghostbuster <aur@sieverdingbeck.com>
_pkgname=nagstamon
_pkgver='2.1.post20161129'
_pkgrel='1'
pkgname=nagstamon-beta
pkgver='2.1.20161129'
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
        '0dc610cf841ab9e8cab138061781fa5b'
)
sha256sums=(
        '494c8720ed572446f1a6c9368ac8e1fb74706f0f551dcef4ee930566f5487015'
)

prepare() {
  cd "$srcdir/"
  tar -xzf "$_pkgname-$_pkgver.tar.gz"
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

