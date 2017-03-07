# Maintainer: mmlb
# vim: set ft=sh :

_pkgname=packer
pkgname=hashicorp-packer
pkgver=0.12.3
pkgrel=1
pkgdesc="Packer is a tool for creating identical machine images for multiple platforms from a single source configuration."
url="http://www.packer.io"
arch=('x86_64' 'i686')
license=('MPL2')
conflicts=('packer' 'packer-color' 'packer-combined' 'packer-git' 'packer-io' 'packer-io-git')
depends=('glibc')

source=('https://raw.githubusercontent.com/mitchellh/packer/master/contrib/zsh-completion/_packer')
source_i686=("${_pkgname}-${pkgver}.zip::https://releases.hashicorp.com/packer/${pkgver}/packer_${pkgver}_linux_386.zip")
source_x86_64=("${_pkgname}-${pkgver}.zip::https://releases.hashicorp.com/packer/${pkgver}/packer_${pkgver}_linux_amd64.zip")

sha256sums=('070675905e14b839420282b280a15a7a72ed34c78ad403532ecd3ed5d9768459')
sha256sums_x86_64=('d11c7ff78f546abaced4fcc7828f59ba1346e88276326d234b7afed32c9578fe')
sha256sums_i686=('d11c7ff78f546abaced4fcc7828f59ba1346e88276326d234b7afed32c9578fe')

package() {
	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 ${srcdir}/_packer ${pkgdir}/usr/share/zsh/site-functions/_packer
}
