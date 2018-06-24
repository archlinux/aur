# Maintainer: ghostbuster <aur@sieverdingbeck.com>
_pkgname=nagstamon
_pkgver='3.1.20180523'
pkgname=nagstamon-beta
pkgver='3.1.0.20180523'
pkgrel=1
pkgdesc="Nagios status monitor for the desktop"
depends=('python-pyqt5' 'qt5-multimedia' 'qt5-svg' 'python-requests' 'python-beautifulsoup4' 'python-keyring' 'python-psutil' 'python-requests-kerberos' 'python-lxml' 'python-dbus')
arch=('any')
url="https://nagstamon.ifw-dresden.de/"
license=('GPL')
conflicts=('nagstamon')
provides=('nagstamon')
source=(
        "https://nagstamon.ifw-dresden.de/files/unstable/${_pkgname}-${_pkgver}.fedora27-1.src.rpm"
)
md5sums=(
        'dd14d78e4eb051547e5717180d0b8b2b'
)
sha256sums=(
        'ff16831729cc0cea128c8b6454643b9cb74cb21d9c189d1373580aec69c674ed'
)

prepare() {
  cd "$srcdir/"
  tar -xzf "$_pkgname-$_pkgver.fedora27.tar.gz"
}

package() {
  cd "${srcdir}/$_pkgname-$_pkgver.fedora27"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

