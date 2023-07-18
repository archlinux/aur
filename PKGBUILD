# Maintainer: Mateusz Gozdek <mgozdekof@gmail.com>

_pkgname='krew'
pkgname="${_pkgname}-bin"
pkgver=0.4.4
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
sha256sums=('e471396b0ed4f2be092b4854cc030dfcbb12b86197972e7bef0cb89ad9c72477')

package() {
	cd "${srcdir}"
  install -Dm755 "krew-linux_amd64" "${pkgdir}/usr/bin/kubectl-krew"
}
