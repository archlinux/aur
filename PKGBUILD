# Maintainer: quinsaiz <edgood228@gmail.com>

pkgname=ppd-cpu-boost
pkgver=1.0.0
pkgrel=1
pkgdesc="Systemd service to synchronize CPU Turbo Boost state with power-profiles-daemon."
arch=('any')
url="https://github.com/quinsaiz/ppd-cpu-boost"
license=('GPL3')
depends=('python' 'python-gobject' 'power-profiles-daemon')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quinsaiz/${pkgname}/archive/${pkgver}.tar.gz")

sha256sums=('17c72469462f854f0a94da2e874957a7be15866e44e4f64ce089d6c75110aa59')

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 ppd-cpu-boost         "${pkgdir}/usr/bin/ppd-cpu-boost"
    install -Dm644 ppd-cpu-boost.service "${pkgdir}/usr/lib/systemd/system/ppd-cpu-boost.service"
    install -Dm644 LICENSE               "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
