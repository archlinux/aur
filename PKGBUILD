# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=TStansel
_gitname=handoff
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Handoff context from one agent to another agent"

pkgver=0.1.7
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('x86_64-unknown-linux-gnu')

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
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
sha256sums=('db550d41bf5912be59998f861f4e9bba53056d2531e0d1201cdeca38e841abaa'
            '1126322e2cc8d165adc4c792eeb195717de2bcc7b39be1ce77959d78e87ef685')
sha256sums_x86_64=('fba591eaa5f02cbfcde8b12d8782501aa533a0fd430c9e283caa8299111651b8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
