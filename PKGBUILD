# Maintainer: Mateusz Gozdek <mgozdekof@gmail.com>

_pkgname='krew'
pkgname="${_pkgname}-bin"
pkgver=0.4.3
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
sha256sums=('5df32eaa0e888a2566439c4ccb2ef3a3e6e89522f2f2126030171e2585585e4f')

package() {
	cd "${srcdir}"
  install -Dm755 "krew-linux_amd64" "${pkgdir}/usr/bin/kubectl-krew"
}
