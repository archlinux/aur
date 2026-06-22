# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=cooperspencer
_gitname=gickup
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Backup tool for your cloud git repositories"

pkgver=0.10.45
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' '386' 'aarch64')
_barch=('linux_amd64' 'linux_386' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Apache-2.0')

depends=('glibc' 'git')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_386=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[2]}.tar.gz")
sha256sums_x86_64=('55cbc9aa8eb21fe2965ed9331aed85cdf1e681817cb1c2471f7df9ff3342d61c')
sha256sums_386=('813f12523466c1c403ecd7a7111e5a3d1d224ae3f911f50d48be21562ae8e1dd')
sha256sums_aarch64=('c51a80df7a82ee008f9a91b9e56f69c1ba505e896e9c2789a1ad7266aeafab41')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
