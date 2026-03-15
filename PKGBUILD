# Maintainer: Damglador <damglador@gmail.com>

pkgname=zerotier-qt
pkgver=1.1
pkgrel=1
pkgdesc="A Qt front-end for ZeroTier"
arch=('any')
url="https://github.com/Damglador/zerotier-qt"
depends=(python pyside6 zerotier-one)
makedepends=(git)
license=(GPL-3.0)
source=(
  "${pkgname}::git+${url}#tag=${pkgver}"
)
sha256sums=('SKIP')

package() {
  cd ${pkgname}
  install -Dm755 main.py "${pkgdir}/usr/bin/zerotier-qt"
  install -Dm644 assets/zerotier-qt.desktop \
    "${pkgdir}/usr/share/applications/zerotier-qt.desktop"
  install -Dm644 assets/zerotier-qt.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/zerotier-qt.svg"
  install -Dm644 assets/zerotier-central-new.png \
    "${pkgdir}/usr/share/pixmaps/zerotier-central-new.png"
  install -Dm644 assets/zerotier-central-old.png \
    "${pkgdir}/usr/share/pixmaps/zerotier-central-old.png"
}
