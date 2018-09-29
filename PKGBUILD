# Contributor: mutlu_inek <mutlu_inek@yahoo.de>
# Contributor: Lucki <Lucki@holarse-linuxgaming.de>
pkgname=qsynergy
pkgver=0.9.1
pkgrel=6
pkgdesc="Qt gui for Synergy which lets you remotely control other computers."
url="http://www.volker-lanz.de/en/software/qsynergy/"
license=(GPL)
arch=('i686' 'x86_64')
depends=('qt4' 'synergy')
makedepends=()
conflicts=()
provides=()
source=(http://sourceforge.net/projects/$pkgname/files/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('17d8989668016185b859332aacf9e7df')

export QT_SELECT=4

package() {
   cd $srcdir/$pkgname-$pkgver
   qmake-qt4 || return 1
   make || return 1
   install -D -m755 $srcdir/$pkgname-$pkgver/dist/debian/qsynergy.desktop $pkgdir/usr/share/applications/qsynergy.desktop
   install -D $srcdir/$pkgname-$pkgver/dist/qsynergy.xpm $pkgdir/usr/share/pixmaps/qsynergy.xpm
   install -D -m755 $srcdir/$pkgname-$pkgver/qsynergy $pkgdir/usr/bin/qsynergy
}
