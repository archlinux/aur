# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=uroybd
_pkgname=DotR
pkgname=${_pkgname,,}-bin
pkgdesc="A dotfiles manager that is as dear as a daughter"

pkgver=2.5.1
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname,,}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname,,}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname,,}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname,,}-${_barch[1]}.tar.gz")
sha256sums=('8cd2c6449c4828698f46c481acab9f8e90e182c7a019946bf4e817e140b19799'
            'a02608ea9f37ef7c8ace0e6fd3637dbb911ef484d4f73d588683b073a14e3dfe')
sha256sums_x86_64=('76b57f93f92ede837f58fa0bc3bcf56d6315955c663ea27bd9f2da43410fd10f')
sha256sums_aarch64=('75be22d5226bf22329c6de09b353b9b0df64ba6a13b801339b03306e4e5d80e0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname,,}" "${pkgdir}/usr/bin/${_pkgname,,}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
