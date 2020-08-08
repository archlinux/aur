# Maintainer: DingYuan Zhang <justforlxz@gmail.com>

pkgname=deepin-polkit-agent-ext-gnomekeyring-git
pkgver=5.0.2.r0.g33f79c4
pkgrel=1
pkgdesc="GNOME keyring extension for dde-polkit-agent"
arch=('x86_64')
url="https://github.com/linuxdeepin/dpa-ext-gnomekeyring"
license=('GPL3')
depends=('deepin-polkit-agent-git' 'libgnome-keyring')
makedepends=('git' 'qt5-tools' 'libgnome-keyring' 'deepin-polkit-agent-git')
conflicts=('deepin-polkit-agent-ext-gnomekeyring')
replaces=('deepin-polkit-agent-ext-gnomekeyring')
provides=('deepin-polkit-agent-ext-gnomekeyring')
groups=('deepin-git')
source=("git://github.com/linuxdeepin/dpa-ext-gnomekeyring/")
sha512sums=('SKIP')

pkgver() {
    cd dpa-ext-gnomekeyring
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd dpa-ext-gnomekeyring

  qmake-qt5
  make
}

package() {
  cd dpa-ext-gnomekeyring
  make INSTALL_ROOT="$pkgdir" install
}
