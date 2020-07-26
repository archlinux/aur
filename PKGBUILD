# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=huhnitor
pkgver=1.1.2
pkgrel=1
pkgdesc=''
url='https://github.com/SpacehuhnTech/Huhnitor'
arch=('x86_64')
license=('MIT')
makedepends=('rust')
source=("https://github.com/SpacehuhnTech/Huhnitor/archive/$pkgver.tar.gz")
sha256sums=('0e29996f223fbb8c04121b775897f83db980e349d1e14d50b86e0067ec875222')

build() {
  tar xzvf $pkgver.tar.gz
  cd "Huhnitor-$pkgver"
  cargo build --release
}

package() {
  cd "Huhnitor-$pkgver"

  install -d "${pkgdir}/opt/${pkgname}"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  
  install -m 755 target/release/${pkgname} "${pkgdir}/opt/${pkgname}"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"

  ln -s /opt/${pkgname}/${pkgname} "${pkgdir}/usr/bin"
}

