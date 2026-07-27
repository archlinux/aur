# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=garrettkrohn
_gitname=treekanga
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A powerful CLI tool for managing Git worktrees with ease"

pkgver=2.4.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('Linux_x86_64' 'Linux_i386' 'Linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('git')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_i686=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[2]}.tar.gz")
sha256sums_x86_64=('f0350c518ac64cb87f66fdf504eb0b909af167c1f2514bd550545b2629e9e59a')
sha256sums_i686=('5d2b4701388133d541fd1e80cafe4d62931c316bab78eb1ca6494a6daf41700e')
sha256sums_aarch64=('8c377d93792565136c466624b8d22a3e2c518023790ce667fe397eb31d1b434a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
