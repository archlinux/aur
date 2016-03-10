# Maintainer: Eugenio M. Vigo <emvigo@gmail.com>
# Contributor: speps <speps dot aur dot archlinux dot org>

pkgname=pumpa
pkgver=0.9.1
pkgrel=3
pkgdesc="A simple pump.io client written in C++ and Qt"
arch=('i686' 'x86_64')
url="http://pumpa.branchable.com"
license=('GPL3')
depends=('qt5-base' 'aspell' 'hicolor-icon-theme' 'tidyhtml')
install="$pkgname.install"
source=("https://saz.im/software/downloads/pumpa/pumpa-${pkgver}.tar.gz")
sha256sums=("c45c7eb3fad527d59ecc9b25a6b29d80c0231d3e733556de23665873a803daa2")

# A small comentary on the source URL. I'm avoiding using the git tags from
# pumpa.branchable.com because it would imply much more work (cloning the repo
# specifying the tag, etc.). The source URL points to the personal server of the
# main developer of Pumpa, "Sazius".

build() {
  cd $pkgname-$pkgver
  qmake PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make INSTALL_ROOT="$pkgdir/" install
}
