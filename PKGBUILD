# Maintainer: Sébastien Luttringer

pkgname=xdg-utils-git
pkgver=2013.07.28
pkgrel=1
pkgdesc='Set of simple scripts for Free Desktop (git version)'
url='http://portland.freedesktop.org/'
arch=('any')
license=('MIT')
conflicts=('xdg-utils')
provides=('xdg-utils')
depends=('bash')
makedepends=('docbook-xsl' 'lynx' 'xmlto')
optdepends=('kdebase-runtime: for KDE support in xdg-open'
            'libgnome: for GNOME support in xdg-open'
            'exo: for Xfce support in xdg-open'
            'xorg-xprop: for Xfce support in xdg-open'
            'pcmanfm: for LXDE support in xdg-open'
            'perl-file-mimeinfo: for generic support in xdg-open'
            'xorg-xset: needed by xdg-screensaver')
source=('git+http://anongit.freedesktop.org/git/xdg/xdg-utils.git')
md5sums=('SKIP')

build() {
  cd ${pkgname%-git}
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -dm755 "$pkgdir/usr/share/desktop-directories"
}

# vim:set ts=2 sw=2 ai et:
