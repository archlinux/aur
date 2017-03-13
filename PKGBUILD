# Maintainer: Michael Herold <arch@michaeljherold.com>
# Maintainer: Ainola

pkgname=scudcloud
pkgver=1.43
_pkghash='65c304416dfdd5f456fa6f7301432a953d5e12d0'
pkgrel=2
epoch=2
pkgdesc="A Slack client for Linux"
arch=('any')
url="https://github.com/raelgc/scudcloud"
license=('MIT')
depends=('libnotify' 'python' 'python-setuptools' 'python-dbus' 'python-gobject'
         'python-pyqt5' 'qt5-webkit')
groups=('messaging')
source=("https://github.com/raelgc/scudcloud/archive/$_pkghash.zip")
sha256sums=('65ac48fa741c1d31861206924cea9f9b67f50cfb79b5b04cde711940b15e2066')

package() {
    cd "${pkgname}-${_pkghash}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
    rm -rf "${pkgdir}/usr/share/icons/ubuntu"**
}
