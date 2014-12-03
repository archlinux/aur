# Maitainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=bsc
pkgver=4.1.0
pkgrel=2
pkgdesc="A file manager for Linux based on Qt-GUI"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/besc/"
license=('GPL')
depends=('qt4')
source=(ftp://ftp.home.vim.org/vol/2/metalab/distributions/tinycorelinux/2.x/tce/src/bsc/${pkgname}_${pkgver}_src.tar.bz2
        $pkgname.desktop)
sha256sums=('a07c26c64a251051be43d403359f1ac1675e0a16e2f19a84dee446b31a183393'
            '4349a1833d2894ca234858780c365e01d665bd40cb57ed7254947cbbf3fb6bfc')

build() {
  cd "${srcdir}"/$pkgname

  qmake-qt4 $pkgname.pro
  make
}

package() {
  cd "${srcdir}"/$pkgname

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
  install -Dm644 help.en.html "${pkgdir}"/usr/share/$pkgname/help.en.html
  install -Dm644 BeesoftCommander.png "${pkgdir}"/usr/share/pixmaps/$pkgname.png
  install -Dm644 "${srcdir}"/$pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.desktop
}
