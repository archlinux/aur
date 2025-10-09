# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

_pkgauthor=kislenko-artem
_pkgname=statusok
pkgname=${_pkgname}-bin
pkgver=0.1.1
_pkgvername=v${pkgver}
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

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}"
               "README-${pkgver}.md::${_urlraw}/README.md"
               "LICENSE-${pkgver}::${_urlraw}/License")
sha256sums_x86_64=('41c596cf01148a2e722203f223eaf6e5ae8ee0c217a345ecc9737f7fb988e2c5'
                   '89647a71118f38cb4545549d178f87df706b6115cde0715c8ca27970e1846b6e'
                   'e764a6f8f5fc2a639fb0c93e8a3b6665fdfac80731a73ba4b26cbbb170869a57')


package() {
    cd "${srcdir}" || exit 1

    install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
