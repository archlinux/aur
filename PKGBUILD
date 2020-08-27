# Maintainer: GI_Jack <GI_Jack@hackermail.com>
pkgbase=clout-init-extra
pkgname=('cloud-init-extra' 'cloud-init-runonce')
pkgver=1.1
pkgrel=1
pkgdesc="Extra configs and templates for cloud-init"
arch=('any')
url="https://github.com/GIJack/cloud-init-extra"
license=('GPL')
depends=('cloud-init')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/GIJack/cloud-init-extra/archive/v${pkgver}.tar.gz")
sha256sums=('2f6040e4e8e0e16a5097375ae4beaa816d48f7422f4bb12eadd125952bbff189')

package_cloud-init-extra() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}

package_cloud-init-runonce() {
  pkgdesc="Dummy Package that runs an initialization script for cloud-init"
  depends+=("cloud-init-extra")
  install=runonce.install
}
