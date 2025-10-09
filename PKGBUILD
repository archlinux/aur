# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgauthor=sanathp
_pkgname=statusok
pkgname=${_pkgname}-bin
pkgver=0.1.1
_pkgvername=${pkgver}
pkgrel=1
pkgdesc='Monitor your Website and APIs from your Computer. Get Notified through Slack, E-mail when your server is down or response time is more than expected'
arch=('x86_64')
_barch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.zip::${url}/releases/download/${_pkgvername}/${_pkgname}_linux.zip"
               "README-${pkgver}.md::${_urlraw}/README.md"
               "LICENSE-${pkgver}::${_urlraw}/License")
sha256sums_x86_64=('d8eebddf6fefe19a80f5a40e4a8f8167325752c9e0aae07a7814630c1b269fa5'
                   '031c2642a826858c95985966017902dde063451c9f03ba9980053ae3bee6831a'
                   'e764a6f8f5fc2a639fb0c93e8a3b6665fdfac80731a73ba4b26cbbb170869a57')


package() {
    cd "${srcdir}" || exit 1

    install -Dm755 "${_pkgname}_linux/${_pkgname}" -t "${pkgdir}/usr/bin"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
