# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=grigio
_gitname=obs-cmd
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A minimal OBS CLI for obs-websocket v5"

pkgver=1.0.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x64-linux')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('e9f19975f3092457d5831f53ce6608952aeb3bcaa29e64ad5624bb88f0dfefde'
            'ba4889412c2cfdd1c0b7d0453202de9264a90a7665a0cd799e6c1ec2f3c062c3')
sha256sums_x86_64=('b7e022a80bf75d8c82b9549e977f36c439ccd2711ffde776cae16874d28cd4cf')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
