# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=kuberlr-bin
pkgver=0.7.0
pkgrel=1
pkgdesc='A tool that simplifies the management of multiple versions of kubectl'
arch=('x86_64')
url='https://github.com/flavio/kuberlr'
license=('Apache')
provides=('kubectl')
conflicts=('kubectl')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/kuberlr_${pkgver}_linux_amd64.tar.gz")
b2sums=('ce485b0473559492f248f1fa40c58509e7f1dcca4405c76c741d0fc87e84c7ceae507b5799a820824be41196384bba59f90500015586fcd6b29ada36f04942de')

package() {
	cd "${srcdir}/kuberlr_${pkgver}_linux_amd64"
    install -D -m 755 kuberlr "${pkgdir}/usr/bin/kuberlr"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/kuberlr/LICENSE"

    ln -s "/usr/bin/kuberlr" "${pkgdir}/usr/bin/kubectl"
}
