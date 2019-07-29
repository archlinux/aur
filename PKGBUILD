# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>
# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname='concourse'
pkgname="${_pkgname}-bin"
pkgver=5.4.0
pkgrel=1
pkgdesc='Concourse is a pipeline-based CI system written in Go.'
arch=(x86_64)
url='https://concourse-ci.org'
license=('Apache')
provides=("${_pkgname}")
replaces=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tgz")
sha512sums=('9f15240ca91c99629862cd4902fe453ee8cd4bdfb5cfb729721569c16c0d3cf665608308a56615412dd70897834b59410e93c715374142912b3c7396c19ecbcb')

package() {
  install -dm755 "${pkgdir}/opt"
  cp -ra "${srcdir}/concourse" "${pkgdir}/opt/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/concourse/bin/concourse "${pkgdir}/usr/bin/concourse"
  ln -s /opt/concourse/bin/gdn "${pkgdir}/usr/bin/gdn"
}

