# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>
# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname='concourse'
pkgname="${_pkgname}-bin"
pkgver=5.0.0
pkgrel=1
pkgdesc='Concourse is a pipeline-based CI system written in Go.'
arch=(x86_64)
url='https://concourse-ci.org'
license=('Apache')
provides=("${_pkgname}")
replaces=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tgz")
sha512sums=('5fa8ce2abf6ae2895cfb780c9b394c69945d49dc1e948d6c74a6157be6ed7adb0011dc691bf41e0cfcfdcc3ff5dd720e83d3fd8c8c6ccfd5a8d5e75ba5c52600')

package() {
  install -dm755 "${pkgdir}/opt"
  cp -ra "${srcdir}/concourse" "${pkgdir}/opt/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/concourse/bin/concourse "${pkgdir}/usr/bin/concourse"
  ln -s /opt/concourse/bin/gdn "${pkgdir}/usr/bin/gdn"
}

