# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: <predrg@gmail.com>

pkgname=alsamixer.app
_appname=AlsaMixer.app
pkgver=0.1+20141204
pkgrel=2
pkgdesc="Simple dockable mixer application for Linux with ALSA drivers."
arch=('i686' 'x86_64')
url="http://www.dockapps.org/file.php/id/253"
url="https://web.archive.org/web/20130814154026/http://dockapps.windowmaker.org/file.php/id/253"
url="http://windowmaker.org/docapps/?name=$_appname"
license=('GPL')
depends=('alsa-lib' 'libxpm')
#source=(https://web.archive.org/web/20130814154026/http://www.dockapps.org/download.php/id/517/$_appname-$pkgver.tar.gz)
#source=(http://dockapps.windowmaker.org/download.php/id/517/$_appname-$pkgver.tar.gz)
#source=(http://distfiles.gentoo.org/distfiles/$_appname-$pkgver.tar.gz)
source=($_appname-$pkgver.tar.gz::http://windowmaker.org/dockapps/?download=$_appname-$pkgver.tar.gz)
md5sums=('SKIP')

build() {
  cd dockapps-*
  make
}

package() {
  cd dockapps-*
  install -D -m755 $_appname "$pkgdir"/usr/bin/$_appname
}
