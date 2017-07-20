# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=minishift-bin
minishift_version=1.3.0
pkgver=${minishift_version//-/_}
pkgrel=1
pkgdesc="Tool that makes it easy to run OpenShift locally."
url="https://github.com/minishift/minishift"
license=('Apache')
arch=('x86_64')
makedepends=()
provides=('minishift')

optdepends=(
  'virtualbox: to use minishift with VirtualBox virtualization'
  'docker-machine-kvm: to use minishisft with KVM virtualization'
)

source=(https://github.com/minishift/minishift/releases/download/v${minishift_version}/minishift-${minishift_version}-linux-amd64.tgz)
sha256sums=('34f989b1f2f68b581e91925bd0a956ed89d110e413919fc6cc19939040ec41c0')


prepare() {
    tar -xf minishift-${minishift_version}-linux-amd64.tgz
}

package() {
  install -Dm755 "${srcdir}/minishift" "${pkgdir}/usr/bin/minishift"
}
