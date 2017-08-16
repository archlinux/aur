# Maintainer: Tomas Kral <tomas.kral@gmail.com>

pkgname=minishift-bin
minishift_version=1.4.1
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
sha256sums=('ceed0feb04911d2304990c46abf10b8c427dd79c3a6ba0fc8edc7b2b7c5119e8')


prepare() {
    tar -xf minishift-${minishift_version}-linux-amd64.tgz
}

package() {
  install -Dm755 "${srcdir}/minishift" "${pkgdir}/usr/bin/minishift"
}
