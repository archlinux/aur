# Maintainer: travisghansen <travisghansen@yahoo.com>

pkgname=firecracker-macvlan-bin
_pkgname=firecracker
pkgver=1.3.1
pkgrel=1
pkgdesc="Secure and fast microVMs for serverless computing"
arch=('x86_64')
url="https://github.com/weaveworks/firecracker/"
license=('Apache')
provides=('firecracker')
conflicts=('firecracker')

source_x86_64=(
 "firecracker::https://github.com/weaveworks/${_pkgname}/releases/download/v${pkgver}-macvtap/firecracker_amd64"
 "jailer::https://github.com/weaveworks/${_pkgname}/releases/download/v${pkgver}-macvtap/jailer_amd64"
)

sha256sums_x86_64=('5437ac6f93bfe1b8bf9d016421153d0af41499a48b2f80ad88097a76a522ce6c'
                   'df55415a99ba69ab9608707392b142d94a0f74ffbb00a08c8ace431e1527f382')

package() {
  install -d "${pkgdir}/usr/bin"

  install -m755 "${srcdir}/firecracker" "${pkgdir}/usr/bin/firecracker"
  install -m755 "${srcdir}/jailer" "${pkgdir}/usr/bin/jailer"
}

