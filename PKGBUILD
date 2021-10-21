# Maintainer: Mateusz Gozdek <mgozdekof@gmail.com>

_pkgname='krew'
pkgname="${_pkgname}-bin"
pkgver=0.4.2
pkgrel=1
pkgdesc='Krew is the package manager for kubectl plugins.'
arch=('x86_64')
url='https://krew.sigs.k8s.io/'
license=('Apache')
depends=()
optdepends=()
makedepends=()
conflicts=("${_pkgname}")
provides=('krew' 'krew-bin')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/kubernetes-sigs/krew/releases/download/v${pkgver}/krew-linux_amd64.tar.gz")
sha256sums=('203bfd8006b304c1e58d9e96f9afdc5f4a055e0fbd7ee397fac9f36bf202e721')

package() {
	cd "${srcdir}"
  install -Dm755 "krew-linux_amd64" "${pkgdir}/usr/bin/kubectl-krew"
}
