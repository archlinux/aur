# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=kuberlr-bin
pkgver=0.8.0
pkgrel=1
pkgdesc='A tool that simplifies the management of multiple versions of kubectl'
arch=('x86_64')
url='https://github.com/flavio/kuberlr'
license=('Apache')
provides=('kubectl')
conflicts=('kubectl')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/kuberlr_${pkgver}_linux_amd64.tar.gz")
b2sums=('8dc73f2a701b52462c24c257b42e544e871d4dd5fdadf5260cc497935a75ffac9633144effe67b226b1b502a37ebdafcbbb9a9cf29dbeeff4407968e1a725b62')

package() {
	cd "${srcdir}/kuberlr_${pkgver}_linux_amd64"
    install -D -m 755 kuberlr "${pkgdir}/usr/bin/kuberlr"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/kuberlr/LICENSE"

    ln -s "/usr/bin/kuberlr" "${pkgdir}/usr/bin/kubectl"
}
