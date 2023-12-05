# Maintainer: mia <mia@mia.jetzt>

pkgname='skytable-bin'
pkgver='0.8.0_beta_1'
pkgrel='1'
pkgdesc='Skytable is a modern NoSQL database powered by BlueQL'
arch=('x86_64')
url='https://skytable.io'
license=('AGPL-3.0-only')
provides=('skytable')
_repo='https://github.com/skytable/skytable'
_dlver='v0.8.0-beta'
_pkgfile="skytable-${_dlver}-${arch}-linux-gnu.deb"
source=("${_repo}/releases/download/${_dlver}/${_pkgfile}")
noextract=("${_pkgfile}")
sha256sums=('d8ebce8e9f19d950d21abaceb0e9a27ef0b0730d9e54996921fdcf7108c10531')

prepare() {
    ar x "${_pkgfile}" data.tar.xz
    tar xf data.tar.xz
}

package() {
    mv "${srcdir}/etc" "${pkgdir}/etc"
    mv "${srcdir}/usr" "${pkgdir}/usr"
    mkdir -p "${pkgdir}/var/lib/skytable"
    mv "${srcdir}/var/lib/skytable/config.yaml.tmp" "${pkgdir}/var/lib/skytable/config.yaml"
}
