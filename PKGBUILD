# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='gotify-cli'
pkgname="${_pkgname}-bin"
pkgver=2.4.0
pkgrel=1
pkgdesc='Command line interface for pushing messages to gotify server'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/gotify/cli'
license=('MIT')
provides=("${_pkgname}")

source=("${_pkgname}-${pkgver}-README.md::${url}/raw/v${pkgver}/README.md"
        "${_pkgname}-${pkgver}-LICENSE::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_armv7h=("${_pkgname}-${pkgver}-armv7h::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm-7")
source_aarch64=("${_pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")

sha256sums=('a22d015d1c26976164fa9ed1aecfac54a7b23da655018e63c317d12e81a22148'
            '5df0ff608e5281cbd72c7087c1f60b0ed241a627d6249b89ad9da8853c7771f7')
sha256sums_x86_64=('251b8d72eddf11317a63ceefd98f655065c62a5ac9a632c5d09709bd747d02af')
sha256sums_armv7h=('59748038c26c13e87c43f49f1b93d6fd5c932aed46f20c46177e6dff8e2ab085')
sha256sums_aarch64=('46353135090c1116f3609e8e4ae99b3b3127f98bf9441566a7aff7eb79343f17')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${_pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
