# Maintainer: Ainola
# Contributor: Michael Herold

pkgname=scudcloud
pkgver=1.60
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
sha256sums=('2a71376c8a7a544525ff128ec7abc305a5dcab1a04d203f5721f4bac0093d19c')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
    mkdir -p "$pkgdir"/usr/share/licenses/scudcloud
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/scudcloud/LICENSE
    rm -rf "${pkgdir}/usr/share/icons/ubuntu"**
}
