# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=mikeleppane
_pkgname=envx
pkgname=${_pkgname}-bin
pkgver=0.6.2
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A powerful and secure environment variable manager"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}")
sha256sums=('21fb5a5395f0f650feb3688f00c858e59eefa51c3c945a19da2c3ed2a4d8a3d2'
            'e180e84eb87619b82bfaa858cd855c507e2cb1f21c51664164eb85cbe8bfb5dd')
sha256sums_x86_64=('414f64383ec9663f74b242ebe09c697f2cab32c1e95dac8cdf47e5360d292f42')
sha256sums_aarch64=('ac50601cc695160c01a0225fa9a267a4a1ee90f34c588e14d500aa20eb84dac8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
