# Maintainer: ZauJulio <zaujulio.dev@gmail.com>
pkgname=cpu-thermal-guard
pkgver=1.0.0
pkgrel=1
pkgdesc="Sustain-gated NBFC fan pulser: acts only on sustained CPU overheat"
arch=('any')
url="https://github.com/ZauJulio/cpu-thermal-guard"
license=('MIT')
depends=('python')
optdepends=('nbfc-linux: fan control backend invoked by the guard'
            'lm_sensors: for manual temperature inspection')
backup=('etc/cpu-thermal-guard.conf')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "cpu_thermal_guard.py" "${pkgdir}/usr/bin/cpu-thermal-guard"
    install -Dm644 "cpu-thermal-guard.conf" "${pkgdir}/etc/cpu-thermal-guard.conf"
    install -Dm644 "cpu-thermal-guard.service" "${pkgdir}/usr/lib/systemd/system/cpu-thermal-guard.service"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
