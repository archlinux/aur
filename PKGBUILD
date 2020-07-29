# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname=credhub-cli
pkgname=${_pkgname}-bin
pkgver=2.8.0
pkgrel=1
pkgdesc='Command line interface to interact with CredHub servers'
arch=('x86_64')
url='https://github.com/cloudfoundry-incubator/credhub-cli'
_rawurl="https://raw.githubusercontent.com/${url##*github.com/}"
license=('APACHE')
provides=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tgz::${url}/releases/download/${pkgver}/${_pkgname%-*}-linux-${pkgver}.tgz"
        "${_pkgname}-${pkgver}-README.md::${_rawurl}/main/README.md")
sha256sums=('dcd4f05eaaea6f356d8ffcbf2692c465b272fcdf773266589f4bc4a891cbe4e4'
            'SKIP')

package() {
  install -Dm755 "${_pkgname%-*}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}-${pkgver}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
