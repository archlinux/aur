# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Francesco Groccia <frgroccia gmail.com>
# Contributor: Jakub "mr.MikyMaus" Fiser <mr@MikyMaus.org>

pkgname=clawsker
pkgver=1.3.8
pkgrel=1
pkgdesc="An applet to edit Claws Mail's hidden preferences."
arch=('any')
url="https://www.claws-mail.org/clawsker.php"
license=(GPL-3.0-or-later)
makedepends=('gettext')
depends=('perl-gtk3' 'perl-locale-gettext' 'perl-file-which' 'claws-mail')
validpgpkeys=('43BC364B16DF0C205EBD75921F0F0A88DE5BCCA6') # Ricardo Mones Lastra <ricardo@mones.org>
source=("https://www.claws-mail.org/tools/$pkgname-$pkgver.tar.xz"{,.asc})
sha256sums=('870e0d6386ae44f49199c46ba26a942d5b8683b0223779372e5a0c8ffedb3921'
            'SKIP')

build()
{
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="/usr"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
}
