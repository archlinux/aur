# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>
# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname='concourse'
pkgname="${_pkgname}-bin"
pkgver=5.3.0
pkgrel=1
pkgdesc='Concourse is a pipeline-based CI system written in Go.'
arch=(x86_64)
url='https://concourse-ci.org'
license=('Apache')
provides=("${_pkgname}")
replaces=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tgz")
sha512sums=('75c2167c330b2a5e5c096b1ecfcd99258ad8c5d4a7a618eb76685b653e032a10f39aec309e29cf3e989b0090d7bcae9c2d3c9688a0ac9a19b46971716a1a17fe')

package() {
  install -dm755 "${pkgdir}/opt"
  cp -ra "${srcdir}/concourse" "${pkgdir}/opt/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/concourse/bin/concourse "${pkgdir}/usr/bin/concourse"
  ln -s /opt/concourse/bin/gdn "${pkgdir}/usr/bin/gdn"
}

