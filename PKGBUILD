# Maintainer: pika02 <pikakolendo02 at gmail dot com>
# Contributor: Javier Tia <javier dot tia at gmail dot com>

pkgname=virtio-win-stable
_pkgname=virtio-win
_ver=0.1.271
# upstream version
_pkgver=${_ver}-1
# package version
pkgver=${_ver}.1
pkgrel=1
pkgdesc='virtio drivers for Windows 7 and newer guests (stable release)'
arch=('any')
url='https://docs.fedoraproject.org/en-US/quick-docs/creating-windows-virtual-machines-using-virtio-drivers/index.html'
license=('BSD-3-Clause')
optdepends=('qemu')
# https://fedorapeople.org/groups/virt/virtio-win/CHANGELOG
# changelog="${_pkgname}.changelog"
# install="${_pkgname}.install"
_url=https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio
source=("${_pkgname}-${_pkgver}.iso::${_url}/${_pkgname}-${_pkgver}/${_pkgname}.iso")
noextract=("${_pkgname}-${_pkgver}.iso")
sha256sums=('bbe6166ad86a490caefad438fef8aa494926cb0a1b37fa1212925cfd81656429')

note() {
	printf "${blue}==>${yellow} NOTE:${bold} $1${all_off}\n"
}

package() {
	IMG_PATH=/var/lib/libvirt/images
	install -Dm 644 ${_pkgname}-${_pkgver}.iso \
		"${pkgdir}${IMG_PATH}/${pkgname}.iso"

	note "The images can be found in ${IMG_PATH}"
}
