# Maintainer: K4YT3X <aur@k4yt3x.com>
pkgname=kuberlr-bin
pkgver=0.4.5
pkgrel=1
pkgdesc='A tool that simplifies the management of multiple versions of kubectl'
arch=('x86_64')
url='https://github.com/flavio/kuberlr'
license=('Apache')
provides=('kubectl')
conflicts=('kubectl')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/kuberlr_${pkgver}_linux_amd64.tar.gz")
b2sums=('b4a1d54425f05b8179c04cfc7722f8aea549603a872955ddeefadd6893c335c96c3f83205c38f34e78c35cda24a893b7b402f28462e4724a545642af18e76119')

package() {
	cd "${srcdir}/kuberlr_${pkgver}_linux_amd64"
    install -D -m 755 kuberlr "${pkgdir}/usr/bin/kuberlr"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/kuberlr/LICENSE"

    ln -s "/usr/bin/kuberlr" "${pkgdir}/usr/bin/kubectl"
}
