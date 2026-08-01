# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=p-arndt
_gitname=hop
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Hop from server to server without ever leaving your terminal"

pkgver=0.6.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Unlincense')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('5cd9ac3dea49a1b811e10f47b953c7205a3fa50fb73a877fbc071362f80cf004')
sha256sums_x86_64=('0cd2cd0577d0a316747fef47fc757ff8545a1fe4688c23226364cd2152743f21')
sha256sums_aarch64=('283c289d02700fd4001c585133e3896c4221af4821de6eaf0eab29f46d927209')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
