# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Alan Vardy <alan@vardy.cc>

_pkgauthor=alanvardy
_pkgname=tod
pkgname=${_pkgname}-bin
pkgver=0.12.1
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
            '924e66ccfee43b7e4bdde6d9c76d71c4c7642a8e1a9abb6cb6c69fd62a5069de')
sha256sums_x86_64=('208ff708159f99a9e0e63ff5bebbba291e7edba010610b08ced1dc4d6d3f4af7')
sha256sums_aarch64=('6b916a0f4c9e85c529a01925ee402dac83b8b34e033e9ef356452e34801942d0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
