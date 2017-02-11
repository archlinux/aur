# Maintainer: Anton Batenev <antonbatenev@yandex.ru>

pkgname=pclcmd
pkgver=0.2
pkgrel=1
pkgdesc='Command line client for pCloud'
arch=('any')
url='https://github.com/abbat/pclcmd'
license=('BSD')
depends=('python>=2.6' 'python-dateutil')
makedepends=('python>=2.6' 'git')
optdepends=(
    'ca-certificates: ssl certificates validation'
    'python-progressbar: pretty console upload/download progressbar'
)
source=("git+https://github.com/abbat/pclcmd.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "${pkgname}"

    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/pyshared"

    install -D -m755 pclcmd.py        "${pkgdir}/usr/share/pyshared/${pkgname}.py"
    install -D -m644 README.md        "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -D -m644 pclcmd.cfg       "${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.cfg"
    install -D -m644 debian/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    ln -s "/usr/share/pyshared/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
}
