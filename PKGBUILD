# Maintainer: Michael Herold <arch@michaeljherold.com>
# Maintainer: Ainola

pkgname=scudcloud
pkgver=1.47
_pkghash='64ea8c4fe6e4a35433010b929b7bbfcb1f8e48bf'
pkgrel=1
epoch=2
pkgdesc="A Slack client for Linux"
arch=('any')
url="https://github.com/raelgc/scudcloud"
license=('MIT')
depends=('libnotify' 'python' 'python-setuptools' 'python-dbus' 'python-gobject'
         'python-pyqt5' 'qt5-webkit')
groups=('messaging')
source=("https://github.com/raelgc/scudcloud/archive/$_pkghash.zip")
sha256sums=('dca4a3c587dca1f8370e942f505cbe06fffd20c8ffc65c8743de590351a63e2a')

package() {
    cd "${pkgname}-${_pkghash}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
    rm -rf "${pkgdir}/usr/share/icons/ubuntu"**
}
