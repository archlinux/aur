# Maintainer: Giedrius Statkevičius <giedrius.statkevicius@gmail.com>

pkgname=twitchnotifier-git
pkgver=20150214
pkgrel=3
pkgdesc='A tool that sits in the background and notifies you using libnotify if a channel you follow comes online or goes offline'
arch=('any')
url='https://github.com/GiedriusS/TwitchNotifier'
license=('GPL')
depends=('python-requests' 'libnotify' 'python-gobject' 'python')
makedepends=('git')
source=(git://github.com/GiedriusS/TwitchNotifier.git)
md5sums=('SKIP')
install=TwitchNotifier.install

package() {
  cd "$srcdir/TwitchNotifier"
  python setup.py install --root="$pkgdir"
  mkdir -p "$pkgdir"/usr/share/doc/TwitchNotifier
  install -m644 twitchnotifier.cfg "$pkgdir"/usr/share/doc/TwitchNotifier
}
