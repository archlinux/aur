# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ttytm
_pkgname=wthrr
pkgname=${_pkgname}-bin
pkgver=1.2.1
pkgrel=2
pkgdesc="Weather companion for the terminal"

url="https://github.com/ttytm/wthrr-the-weathercrab"
urlraw="https://raw.githubusercontent.com/ttytm/wthrr-the-weathercrab"

arch=('x86_64')
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=('!strip')

source=("README-${pkgver}.md::${urlraw}/v${pkgver}/README.md"
		"LICENSE-${pkgver}::${urlraw}/v${pkgver}/LICENSE")
source_x86_64=("https://github.com/ttytm/wthrr-the-weathercrab/releases/download/v${pkgver}/wthrr-linux-x86_64.deb")
sha256sums=('171379ef1164ba579a4db5d9f5d1d7feeee5f9ef5b44c41806117c83402181b0'
            '826a0a547dad7e4f1612b496b6129943ca40a67674939bcf9803cf52d8e9d6f1')
sha256sums_x86_64=('2740cb8d7375e37a12564528039380050280d8b8af6b29ea97a6a89333a9d42e')


package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.xz"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

