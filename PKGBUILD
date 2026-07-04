# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=etcoder-642
_gitname=FlowHook
_appname=${_gitname,,}
pkgname=${_appname}-bin
pkgdesc="A lightweight C++ file-watcher CLI using Linux inotify"

pkgver=0.1.2
pkgrel=1
_gitversion=v${pkgver}-alpha

arch=('x86_64')
_barch=('linux-amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc' 'libstdc++')

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.zip::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}-v${pkgver}.zip")
sha256sums=('c35f1aeb19b90cb8273af652fb0cac77945d54e192f0a73a1062d8c92ed951c6'
            '16f5696e8c626d060f5a5bae8bcd28fad4451cd4943d49f0e79f7eef4fa60324')
sha256sums_x86_64=('5f89bc0d9fa25f07335e69d3d652ee570498dbaacdd9039bcb6cc729cc3136fa')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
