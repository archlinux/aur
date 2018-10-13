# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=gitmaster
pkgver=0.1
pkgrel=1
pkgdesc="GitMaster is GUI git client."
arch=('x86_64' 'i686')
url="https://github.com/bokic/gitmaster"
license=('GPL')
groups=()
depends=('qt5-base' 'libgit2')
makedepends=('qt5-base' 'libgit2')
conflicts=()
replaces=()
backup=()
options=()


source=("https://github.com/bokic/gitmaster/archive/0.1.zip")
md5sums=("ef4e8fe2a6dd43b8314549cf2d55f87f")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  qmake
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm755 bin/gitmaster "$pkgdir/usr/bin/gitmaster"
  install -Dm644 gitmaster.desktop "$pkgdir/usr/share/applications/gitmaster.desktop"
  install -Dm644 gitmaster.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/gitmaster.svg"
}
