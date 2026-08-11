# Maintainer: Moritz Luedecke <moritz.luedecke@skweez.net>

pkgname=gitflow-next-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='A modern reimplementation of git-flow in Go.'
arch=('i686' 'x86_64' 'aarch64')
url='https://git-flow.sh'
license=('BSD-2-Clause')
depends=('git')
provides=('gitflow')
conflicts=('gitflow' 'gitflow-git' 'gitflow-avh')
_baseurl="https://github.com/gittower/git-flow-next/releases/download/v${pkgver}"
source=("https://github.com/gittower/git-flow-next/blob/v${pkgver}/README.md" "https://github.com/gittower/git-flow-next/blob/v${pkgver}/LICENSE")
source_i686=("${_baseurl}/git-flow-next-v${pkgver}-linux-386.tar.gz")
source_x86_64=("${_baseurl}/git-flow-next-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_baseurl}/git-flow-next-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('SKIP' 'SKIP')
sha256sums_i686=('ea8a676ecf78fdde96ae19c6f38c98a43144557d0557b40f84049c9a536179b7')
sha256sums_x86_64=('e0b8fa01168b2b8ac8a068cc346c345e4248ce84f4db9b52d3882f1f57eb1c65')
sha256sums_aarch64=('991b71e5a1f73de2140ee01ad010505556d9017a15e1643210ed4d657dc7a050')

package() {
    install -Dm755 "${srcdir}/git-flow" "${pkgdir}/usr/bin/git-flow"

    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/" "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/"
}
