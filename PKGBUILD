# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=aryankahar31
_gitname=runx
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Universal project launcher with portable runtimes. Run projects without installing Node, Python, or other toolchains globally."

pkgver=0.7.2
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-x64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md" "LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('96c3e977d20304921143880b3e7a23e774f4afe47bdf941b869af78b93a466dc'
            'fbd9c09c7b576e977fa12ea54df5861ae6ae9b130487f1e1664550f743257f31')
sha256sums_x86_64=('866482d1a2ad46db9d57f8c3aed7d5e98d685d9dfba655613847612f39ee65d3')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
