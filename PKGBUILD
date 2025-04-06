# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_appName=EFIBootEditor
_pkgauthor=Neverous
_pkgname=efibooteditor
pkgname=${_pkgname}-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="Boot Editor for (U)EFI based systems."
arch=('x86_64' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('LGPL3')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('tar')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.txt"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_appName}-v${pkgver}-ubuntu-24.04-qt-6.2.4-GCC.deb")
sha256sums=('e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118'
            'e46766a93708412ae6f11c6f2775c33c75dc8264b8c4815bb3c424560de3dba2')
sha256sums_x86_64=('82afd4436b27c0c3e7a2ac5220fbd7a3957923dba21001db73f7898ce7b78961')


package() {
	cd "${pkgdir}"

	# this extracts all into the pkgdir
	tar -xf "${srcdir}/data.tar.gz"


	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
