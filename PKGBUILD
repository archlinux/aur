# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=devlinx9
_gitname=muon-ssh
_appname=${_gitname//-/}
pkgname=${_gitname}-bin
pkgdesc="Graphical SFTP client and terminal emulator with helpful utilities."

pkgver=3.0.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

depends=('bash' 'java-runtime>=11')

options=('!strip')

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.deb::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}.deb")
sha256sums=('9b8f1e2efac3cd70007f82b7dc411da7481ad01cf813ace2003bc1881078c361'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('a565d7286a4ccd2b8e464a6e879c646a7b4a19b7f7805af01f5848820777c5bc')


package() {
	cd "${pkgdir}"

	tar -xf "${srcdir}/data.tar.gz"

	install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
