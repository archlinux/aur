# Maintainer: Bram Swenson <bram at amplified dot work>
# Maintainer: pancho horrillo <pancho at pancho dot name>
# Maintainer: Julien Nicoulaud <julien dot nicoulaud at gmail dot com>

_pkgname='concourse'
pkgname="${_pkgname}-bin"
pkgver=5.6.0
pkgrel=1
pkgdesc='Concourse is a pipeline-based CI system written in Go.'
arch=(x86_64)
url='https://concourse-ci.org'
license=('Apache')
provides=("${_pkgname}")
replaces=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("https://github.com/${_pkgname}/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.tgz")
sha512sums=('dcd05545186db5fe1f594adf80a7be88a2d24ad6ba55ec7b49034f4daf3ec319b70ba2a62b5cb14002fd2aedb26ae1fe851dd4ecefb75f6882ba78f8ba53d1dc')

package() {
  install -dm755 "${pkgdir}/opt"
  cp -ra "${srcdir}/concourse" "${pkgdir}/opt/"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/concourse/bin/concourse "${pkgdir}/usr/bin/concourse"
  ln -s /opt/concourse/bin/gdn "${pkgdir}/usr/bin/gdn"
}
