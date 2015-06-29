# Maintainer: aksr <aksr at t-com dot me>
pkgname=ce
pkgver=4.6
pkgrel=1
pkgdesc="(Chet's Editor), a small, fast, emacs-like text editor."
arch=('i686' 'x86_64')
url="http://tiswww.case.edu/php/chet/"
license=('GPL')
depends=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://tiswww.case.edu/php/chet/dist/$pkgname-$pkgver.tar.gz")
md5sums=('ea886c3867900729dc883757c307d99b')
sha1sums=('94d7ef6db3e9baf60205e922038d040380b67879')
sha256sums=('76e1659c76b1bbc6bbc32451585034c8ca7d2a782e61f229a330cde887708d54')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 ce "${pkgdir}/usr/bin/ce"
  install -Dm755 xce "${pkgdir}/usr/bin/xce"
  install -Dm755 teach-ce "${pkgdir}/usr/bin/teach-ce"
  install -Dm644 doc/ce.1 "${pkgdir}/usr/share/man/man1/ce.1"
  install -Dm644 doc/xce.1 "${pkgdir}/usr/share/man/man1/xce.1"
  install -Dm644 doc/ce.ps "${pkgdir}/usr/share/doc/${pkgname}/ce.ps"
  install -Dm644 doc/ce.key "${pkgdir}/usr/share/doc/${pkgname}/ce.key"
  install -Dm644 doc/ce.help "${pkgdir}/usr/share/doc/${pkgname}/ce.help"
  install -Dm644 doc/xce.ps "${pkgdir}/usr/share/doc/${pkgname}/xce.ps"
  install -Dm644 doc/TUTORIAL "${pkgdir}/usr/lib/${pkgname}/TUTORIAL"
  install -Dm644 doc/FUNCTIONS "${pkgdir}/usr/lib/${pkgname}/FUNCTIONS"
}

