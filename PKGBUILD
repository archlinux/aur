# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=kuberlr-bin
pkgver=0.4.2
pkgrel=1
pkgdesc='A tool that simplifies the management of multiple versions of kubectl'
arch=('x86_64')
url='https://github.com/flavio/kuberlr'
license=('Apache')
provides=('kubectl')
conflicts=('kubectl')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/kuberlr_${pkgver}_linux_amd64.tar.gz")
b2sums=('4dc918b612aaf47c78dc745dc0cddac57988348b27147702b610003fd2a3de75dfc9d7ccd542306e4d8f5640178dd65093202ed100825ac8a30373173459705d')

package() {
	cd "${srcdir}/kuberlr_${pkgver}_linux_amd64"
    install -D -m 755 kuberlr "${pkgdir}/usr/bin/kuberlr"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/kuberlr/LICENSE"

    ln -s "/usr/bin/kuberlr" "${pkgdir}/usr/bin/kubectl"
}
