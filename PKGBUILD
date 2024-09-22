# Contributor: Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=gsa
pkgver=23.3.0
pkgrel=3
pkgdesc='Greenbone Security Assistant'
arch=('x86_64')
url="https://github.com/greenbone/gsa"
license=('GPL')
depends=('gsad' 'openvas-scanner')
makedepends=('yarn' 'doxygen' 'xmltoman' 'nodejs' 'npm' 'terser')
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/gsa/archive/v${pkgver}.tar.gz")
sha512sums=('d9eaa282ba4babf3f42939f4918b5726fa539e4c4fe64e89ae77cf1887b2f10d5a97f085b168264e7b23c468f194e0c58c565ee86458812065947a4d96c43788')


build() {
  cd "${pkgname}-${pkgver}"
  yarn
  yarn build
}

package() {
  cd "${pkgname}-${pkgver}"

  install -d $pkgdir/usr/share/gvm/gsad/web
  cp -r build/* $pkgdir/usr/share/gvm/gsad/web/
}
