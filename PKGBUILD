# Maintainer: Joël Grimberg <joelgrimberg@gmail.com>
pkgname=timesheetz-bin
pkgver=1.38.0
pkgrel=1
pkgdesc='Timesheet tracking TUI and REST API for freelancers'
arch=('x86_64' 'aarch64')
url='https://github.com/joelgrimberg/timesheetz'
license=('MIT')
provides=('timesheetz')
conflicts=('timesheetz')
options=('!strip')

source_x86_64=("timesheetz-${pkgver}-x86_64.tar.gz::https://github.com/joelgrimberg/timesheetz/releases/download/v${pkgver}/timesheetz_Linux_x86_64.tar.gz")
source_aarch64=("timesheetz-${pkgver}-aarch64.tar.gz::https://github.com/joelgrimberg/timesheetz/releases/download/v${pkgver}/timesheetz_Linux_arm64.tar.gz")
sha256sums_x86_64=('ba19264ed0181daace6067544a6c962ada2260bf12c7267987e5b7c7c22ad1d5')
sha256sums_aarch64=('de979b905c3f991d2c279cf60c1d0b6dd9566c64d730406507b205eb002fb067')

package() {
    install -Dm755 "${srcdir}/timesheet" "${pkgdir}/usr/bin/timesheetz"
    install -Dm644 "${srcdir}/LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
