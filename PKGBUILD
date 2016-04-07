# Maintainer: Matthew Gamble

pkgname=pushjournal
pkgver=0.2.0
pkgrel=1
pkgdesc="Push notifications for systemd's journal."
arch=("any")
license=("BSD")
url="https://github.com/r-darwish/pushjournal"
install="pushjournal.install"
depends=("systemd" "python" "python-systemd" "python-click" "python-logbook" "python-netifaces" "python-requests" "python-yaml")
makedepends=("python-setuptools")
source=("https://github.com/r-darwish/pushjournal/archive/${pkgver}.tar.gz")
sha256sums=('97e72798327995d47eebd58de362f137e5ff9329ea754fc453d85fdaebae758d')

package() {
    cd "pushjournal-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/pushjournal/LICENSE"
    install -Dm644 examples/pushjournal.service "${pkgdir}/usr/lib/systemd/system/pushjournal.service"
}
