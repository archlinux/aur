# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=adesklet-aurnotify
pkgver=0.0.6
pkgrel=2
pkgdesc="Displays the latest updated packages from Arch Linux User Repository"
arch=('any')
url="http://adesklets.sourceforge.net/desklets.html"
license=('GPL')
depends=('adesklets')
groups=('adesklet-desklets')
backup=('usr/share/adesklets/aurnotify/config.txt')
source=(http://downloads.sourceforge.net/adesklets/aurnotify-$pkgver.tar.bz2)
md5sums=('5935d94159c7b0d670e843598732206d')

package() {
  cd "${srcdir}"/aurnotify-$pkgver

#Python2 fix
  sed -i 's_python_python2_' aurnotify.py

  install -d "${pkgdir}"/usr/share/adesklets/aurnotify/icons

  install -m664 -g adesklets GNUmakefile README \
    "${pkgdir}"/usr/share/adesklets/aurnotify/
  install -Dm664 -g adesklets config.txt.sample \
    "${pkgdir}"/usr/share/adesklets/aurnotify/config.txt
  install -m664 -g adesklets icons/new.gif \
    "${pkgdir}"/usr/share/adesklets/aurnotify/icons

  install -Dm775 -g adesklets aurnotify.py \
    "${pkgdir}"/usr/share/adesklets/aurnotify/aurnotify.py
}
