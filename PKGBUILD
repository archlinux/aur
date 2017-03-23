# Maintainer: Michael Herold <arch@michaeljherold.com>
# Maintainer: Ainola

pkgname=scudcloud
pkgver=1.48
_pkghash='a7736b04311f21328e24525f0d5976f84c6962d4'
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
sha256sums=('30afafdf15eb2444345da9b1bcfd103921ccddf10a91164fd69b1792f14fa134')

package() {
    cd "${pkgname}-${_pkghash}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
    rm -rf "${pkgdir}/usr/share/icons/ubuntu"**
}
