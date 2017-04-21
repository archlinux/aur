# Maintainer: Michael Herold <arch@michaeljherold.com>
# Maintainer: Ainola

pkgname=scudcloud
pkgver=1.57
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
sha256sums=('ded4ff41297179c6c8c0d4f9c4946d98e1f6b8bf756df8dc21fc5d7286a3db85')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
    mkdir -p "$pkgdir"/usr/share/licenses/scudcloud
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/scudcloud/LICENSE
    rm -rf "${pkgdir}/usr/share/icons/ubuntu"**
}
