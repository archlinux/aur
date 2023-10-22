# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Maintainer since 18.11.2021:  Aleksey Nikiforov <a at nikif dot net>

pkgname=toxiproxy-cli-bin
pkgver=2.6.0
pkgrel=2
pkgdesc='A TCP proxy to simulate network and system conditions for chaos and resiliency testing (CLI client)'
arch=('x86_64')
url="http://toxiproxy.io"
license=('MIT')
provides=('toxiproxy-cli')
source=("${pkgname}-${pkgver}::https://github.com/Shopify/toxiproxy/releases/download/v${pkgver}/toxiproxy-cli-linux-amd64"
        'LICENSE::https://github.com/Shopify/toxiproxy/raw/master/LICENSE')
sha256sums=('186fc2cc4fc9a077a2bcb3bbed31f974f1f4ff19d7009148b68b442b06796c17'
            'c305a1ef46fe6a38b357a943945191184df3cdef9ed833e171c5d811d560ad8f')

package() {
  install -Dm755 "${srcdir}"/toxiproxy-cli* "${pkgdir}/usr/bin/toxiproxy-cli"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
