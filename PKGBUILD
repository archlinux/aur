# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

_pkgauthor=DimitarPetrov
_pkgname=stegify
pkgname=${_pkgname}-bin
pkgver=1.2
pkgrel=3
pkgdesc='Go tool for LSB steganography, capable of hiding any file within an image'
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')
provides=('stegify')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/stegify_linux_x86-64")

sha256sums=('92e64e90dc5712f5b365728023796dc5521d1c567461a99fb1abf6bbc708a6fb'
            '1167ed7aa91886eb92244d7835c32bef0182bdd3237e3469312fa8aeb28371bc')
sha256sums_x86_64=('1537a356963a8748b3d2f873a20781fb621964b825e8769c56eaf79ded14dba1')

package() {
  install -Dm755 "${srcdir}"/stegify* "${pkgdir}/usr/bin/stegify"

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "${srcdir}/README-${pkgver}" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
