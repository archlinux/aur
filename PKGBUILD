# Maintainer: Mario <mario@example.com>
pkgname=gdg-bin
pkgver=0.9.2
pkgrel=1
pkgdesc='CLI tool to backup and restore Grafana dashboards, connections, and other resources (Grafana Dash-n-Grab)'
arch=('x86_64' 'aarch64')
url='https://github.com/esnet/gdg'
license=('BSD-3-Clause')
provides=('gdg')
conflicts=('gdg')

source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/esnet/gdg/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/esnet/gdg/releases/download/v${pkgver}/gdg_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/esnet/gdg/releases/download/v${pkgver}/gdg_Linux_arm64.tar.gz")

sha256sums=('96b9ca9fdc37ad5ecf0e279997062f408283b247d5b47b6b741cd33965853796')
sha256sums_x86_64=('eade9b07a3f8ad01787715f93f1966b32301f5baf7d827d52d6b16dd4dfb8613')
sha256sums_aarch64=('3a5b1c90df74da2bcf77890d58c4848b69c8c1ea30378021db8689bafb8fb565')

package() {
    install -Dm755 gdg "${pkgdir}/usr/bin/gdg"
    install -Dm755 gdg-generate "${pkgdir}/usr/bin/gdg-generate"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 config/gdg-example.yml "${pkgdir}/usr/share/doc/${pkgname}/gdg-example.yml"
    install -Dm644 config/templates-example.yml "${pkgdir}/usr/share/doc/${pkgname}/templates-example.yml"
}
