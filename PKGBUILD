# Maintainer: Umar Alfarouk <medrivia@gmail.com>
pkgname=xtemplate-bin
pkgver=0.8.4
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/infogulch/xtemplate"
license=('Apache-2.0')
source_x86_64=("${url}/releases/download/v${pkgver}/xtemplate-amd64-linux_v${pkgver}.zip")
source_aarch64=("${url}/releases/download/v${pkgver}/xtemplate-arm64-linux_v${pkgver}.zip")
provides=('xtemplate')
conflicts=('xtemplate')
sha256sums_x86_64=('a7d5cb4e78b1d6c32b9b1598469f2dafddb4679f4f60b80488360544dba3b6d6')
sha256sums_aarch64=('3381ee5fbe6bf7e3256973038d0097e77dc605fe7bf3bd1a0fe306eaed5e4617')

package() {
	install -Dm755 "${srcdir}/xtemplate" "${pkgdir}/usr/bin/xtemplate"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

_pkgver() {
	curl -s https://api.github.com/repos/infogulch/xtemplate/releases?per_page=5 | jq 'first.name' -r | tr -cd '[:digit:].'
}

options=('!debug')
