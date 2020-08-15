# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=cloud-init-extra
pkgver=1.0
pkgrel=1
pkgdesc="Extra configs and templates for cloud-init"
arch=('any')
url="https://github.com/GIJack/cloud-init-extra"
license=('GPL')
depends=('cloud-init')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/GIJack/cloud-init-extra/archive/v${pkgver}.tar.gz")
sha256sums=('4cf1ac772773466c3418605ebf357e7a3d8660286af0721d69331b4c4efdd41d')

package() {
  cd "${pkgname}-${pkgver}"
  #make DESTDIR="$pkgdir/" install
  install -Dm644 config/00_datasources.cfg "${pkgdir}/etc/cloud/cloud.cfg.d/00_datasources.cfg"
  install -Dm644 template/hosts.arch.tmpl "${pkgdir}/etc/cloud/templates/hosts.arch.tmpl"
}
