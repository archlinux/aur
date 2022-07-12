# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_pkg="archiso"
_distro="archlinux"
_pkgbase="${_pkg}-profiles"
profile="ereleng"
_pkgname="${_distro}"
pkgname=("${_pkgname}-libvirt")
pkgver="v1.0"
pkgrel=1
pkgdesc="Arch Linux install drive (libvirt VM)."
arch=('i686'
      'pentium4'
      'x86_64')
license=('AGPL3')
url="https://gitlab.${_distro}.org/tallero/${_pkgbase}"
provides=("${_distro}-${profile}-libvirt")
depends=("${_distro}"
	 "libvirt")
checkdepends=('shellcheck')
source=("${_pkg}-template.xml"
	"${_pkg}-storage-template.xml"
        "uuidgen")
sha256sums=("SKIP"
	    "SKIP"
            "SKIP")

## shellcheck disable=SC2154
package() {
  local _dest="${pkgdir}/etc/libvirt/qemu"
  install -dm755 "${_dest}"
  install -dm755 "${_dest}/storage"
  install -Dm644 "${_pkg}-template.xml" "${_dest}/${_distro}.xml"
  install -Dm644 "${_pkg}-storage-template.xml" "${_dest}/storage/${_distro}.xml"
}
