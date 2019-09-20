# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>
# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname='concourse'
pkgname="${_pkgname}-bin"
pkgver=5.5.1
pkgrel=1
pkgdesc='Concourse is a pipeline-based CI system written in Go.'
arch=(x86_64)
url='https://concourse-ci.org'
license=('Apache')
provides=("${_pkgname}")
replaces=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tgz")
sha512sums=('b0cf96ad67006f36a62b7c28c9fab40655b16e60fb77aec092921feff1150da9c5f4269de8ba23aad020c2eb34d78acac64996680eced25e8002aeeef169c3db')

package() {
  install -dm755 "${pkgdir}/opt"
  cp -ra "${srcdir}/concourse" "${pkgdir}/opt/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/concourse/bin/concourse "${pkgdir}/usr/bin/concourse"
  ln -s /opt/concourse/bin/gdn "${pkgdir}/usr/bin/gdn"
}

