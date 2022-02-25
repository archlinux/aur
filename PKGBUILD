# Maintainer: justforlxz <justforlxz@gmail.com>

# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Xu Fasheng <fasheng.xu[AT]gmail.com>

pkgname=deepin-icon-theme-git
pkgver=2021.11.24.r0.g572b049d
pkgrel=1
pkgdesc="Deepin GTK Theme"
arch=('any')
url="https://github.com/linuxdeepin/deepin-gtk-theme"
license=('LGPL3')
optdepends=('gtk-engine-murrine: for gtk2 themes')
groups=('deepin')
source=("$pkgname::git://github.com/linuxdeepin/deepin-icon-theme/")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  make hicolor-links
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install

  cp -a ./Sea ./usr/share/icons/hicolor "$pkgdir"/usr/share/icons/
}
