# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contribtor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=adesklet-adeskclock
pkgver=0.2.0
pkgrel=2
pkgdesc="A skinnable analog clock adesklet"
url="http://adesklets.sourceforge.net/desklets.html"
arch=('any')
license=('GPL')
depends=('adesklets')
groups=('adesklet-desklets')
backup=('usr/share/adesklets/adeskclock/config.txt')
source=(http://downloads.sourceforge.net/adesklets/adeskclock-$pkgver.tar.bz2)
md5sums=('53fa9587bbfeceb60e95be4ad0c198f4')

package() {
  cd "${srcdir}"/adeskclock-$pkgver

#Python2 fix
  sed -i 's_env python_env python2_' adeskclock.py

  install -d "${pkgdir}"/usr/share/adesklets/adeskclock
  cp -r COPYING  GNUmakefile  README skins/ "${pkgdir}"/usr/share/adesklets/adeskclock/
  chmod -R 644 "${pkgdir}"/usr/share/adesklets/adeskclock/
  chown -R :adesklets "${pkgdir}"/usr/share/adesklets/adeskclock/

  install -m775 -g adesklets adeskclock.py "${pkgdir}"/usr/share/adesklets/adeskclock/
}
