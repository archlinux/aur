# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Alan Vardy <alan@vardy.cc>

_pkgauthor=alanvardy
_pkgname=tod
pkgname=${_pkgname}-bin
pkgver=0.11.1
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="A tiny unofficial Todoist client"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-linux-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${pkgver}-linux-${_barch[1]}.tar.gz")
sha256sums=('997fcdc2b5ac6d4724a6d083b93cfe868db504521af5f93d61350cce8e3a5d12'
            '4aeb32af643fe01bfe331c1975a5f844aff74068d84d4284ffdcb0c9e77c8da3')
sha256sums_x86_64=('cd395b740cad4a56e2bcbacf2dfd55a65b2ad37bf21f1478a11d949dedaf3087')
sha256sums_aarch64=('54d09ab040505efa19521bd5a84f9fd0ef915f9c519766a83c02bcedd119bbb4')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
