# Maintainer: Ainola
# Contributor: Michael Herold

pkgname=scudcloud
pkgver=1.65
pkgrel=2
epoch=2
pkgdesc="A Slack client for Linux"
arch=('any')
url="https://github.com/raelgc/scudcloud"
license=('MIT')
depends=('libnotify' 'python-setuptools' 'python-dbus' 'python-gobject'
         'python-pyqt5' 'qt5-webkit')
makedepends=('python-jsmin')
groups=('messaging')
source=("https://github.com/raelgc/scudcloud/archive/v${pkgver}.tar.gz")
sha256sums=('1b5420a868a37e181655e9799a3d1fcbbc0b0112349c44ac3d7936b626334791')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
    mkdir -p "$pkgdir"/usr/share/licenses/scudcloud
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/scudcloud/LICENSE
    rm -rf "${pkgdir}/usr/share/icons/ubuntu"**
}
