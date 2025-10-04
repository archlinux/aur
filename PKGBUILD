# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Zixiao-System
_pkgname=leizi-shell
_pkgexec=leizi
pkgname=${_pkgname}-bin
pkgver=1.4.0
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Modern POSIX-compatible shell with ZSH-style arrays and Powerlevel10k-inspired prompts"
arch=('x86_64')
_barch=('x64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('GPL-3.0')

provides=("${_pkgexec}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'readline')

install=leizi-shell.install

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "AGENTS-${pkgver}.md::${_urlraw}/AGENTS.md"
        "CLAUDE-${pkgver}.md::${_urlraw}/CLAUDE.md"
        "TODO-${pkgver}.md::${_urlraw}/TODO.md"
        "ROADMAP-${pkgver}.md::${_urlraw}/ROADMAP.md"
        "CONTRIBUTING-${pkgver}.md::${_urlraw}/CONTRIBUTING.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgexec}-linux_${_barch[0]}.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'bb8db8266ce52fb506f89fd291dd7534e634ccf07ece53857b91f97153bb11b3'
            '8d3d031b106b05cbc7d0e1c195443244830f912d8fefff75db9d300df39e9915'
            '93954e48b924caf6f2ba5b595292b58759778dbf2c85b1db5a03ee13b44fa570'
            'f689664f59ca597cd559fde978288780b21c2488522bb9e691a844af570c126d'
            '67afe481d24f1d1ca5eadfc276bb86c360bc863a8d185598144f2d7292fb24a4'
            '8ad0fca1e5b2a3ae07e6a8f51c99b616e5dd0fc3121a33a732f0b5c969e0c4c7'
            '2db1614c95ae03fca764d5c70dd990ef5c146415ce48510f5cc71462195c4c78')
sha256sums_x86_64=('5cbe924d90064d1edad955fcf268e44c2b179031c24ef70dff81ca0eb009b888')



package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgexec}" "${pkgdir}/usr/bin/${_pkgexec}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "AGENTS-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/AGENTS.md"
	install -Dm644 "CLAUDE-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CLAUDE.md"
	install -Dm644 "TODO-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/TODO.md"
	install -Dm644 "ROADMAP-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/ROADMAP.md"
	install -Dm644 "CONTRIBUTING-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
