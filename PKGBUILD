# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=savoirfairelinux
_pkgname=cqfd
pkgname=${_pkgname}-bin
pkgver=5.7.2
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc="Run commands with the same user and directory inside a docker container"
arch=('any')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('GPL-3.0')

depends=('bash')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("${_pkgname}-${pkgver}.tzst::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-${pkgrel}-any.pkg.tar.zst")
sha256sums=('aac58a48f51463593dc96c527e4a1c79d39ede4231297e64474430fd0086b042')

noextract=("${_pkgname}-${pkgver}.tzst")

package() {
	cd "${pkgdir}/" || exit

	tar -xvf "${srcdir}/${_pkgname}-${pkgver}.tzst"
	rm -rf .{BUILDINFO,MTREE,PKGINFO}
}
