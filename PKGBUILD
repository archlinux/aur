# Maintainer: Michael Herold <arch@michaeljherold.com>
# Maintainer: Ainola

pkgname=scudcloud
pkgver=1.50
pkgrel=1
epoch=2
pkgdesc="A Slack client for Linux"
arch=('any')
url="https://github.com/raelgc/scudcloud"
license=('MIT')
depends=('libnotify' 'python-setuptools' 'python-dbus' 'python-gobject'
         'python-pyqt5' 'qt5-webkit')
groups=('messaging')
source=("https://github.com/raelgc/scudcloud/archive/v${pkgver}.tar.gz")
sha256sums=('57700c1202add2029a87287a2b3e3cc3b2726e7ef8d375431c4f4d2c506807c3')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
    mkdir -p "$pkgdir"/usr/share/licenses/scudcloud
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/scudcloud/LICENSE
    rm -rf "${pkgdir}/usr/share/icons/ubuntu"**
}
