# Maintainer: Maximilian Hill <arch.pkgs@maxhill.eu>

pkgname=nimiq-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="Nimiq core"
arch=('x86_64')
url="https://nimiq.com"
license=('Apache')
groups=('base-devel')
depends=('npm')
source=(
  "https://repo.nimiq.com/rpm/stable/${arch}/nimiq-${pkgver}-${pkgrel}.${arch}.rpm"
)
noextract=("${source[@]##*/}")
backup=(
  "etc/nimiq/nimiq.conf"
)
sha256sums=(
  '26dcfb2f6299a274f812dae1576b926acb04336e7dada7d8571ece93d8668cff'
)

package() {
  cd "${pkgdir}"
  bsdtar -xvf "${srcdir}/nimiq-$pkgver-$pkgrel.$arch.rpm"
  rm -rvf "etc/yum.repos.d"
  rm -rvf "etc/pki"
}
