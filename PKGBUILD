# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=kuberlr-bin
pkgver=0.6.1
pkgrel=1
pkgdesc='A tool that simplifies the management of multiple versions of kubectl'
arch=('x86_64')
url='https://github.com/flavio/kuberlr'
license=('Apache')
provides=('kubectl')
conflicts=('kubectl')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/kuberlr_${pkgver}_linux_amd64.tar.gz")
b2sums=('3015b7905b74aa70568f1599a3265aa41e155d2a9e6eceaffd8d1417a492ec35e3368a30e704b5c7e49b0e475ed10bd5e0f89380e830ea6318ee63d967e8484c')

package() {
	cd "${srcdir}/kuberlr_${pkgver}_linux_amd64"
    install -D -m 755 kuberlr "${pkgdir}/usr/bin/kuberlr"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/kuberlr/LICENSE"

    ln -s "/usr/bin/kuberlr" "${pkgdir}/usr/bin/kubectl"
}
