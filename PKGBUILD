# Maintainer: Justin Dray <justin@dray.be>
# Contributor: Tristan Webb <tristanjwebb@gmail.com>
pkgname=wemux
pkgver=3.2.0
pkgrel=1
pkgdesc="Multi-user Tmux made easy"
url="https://github.com/zolrath/wemux"
arch=('any')
license=('MIT')
depends=('tmux' 'lsof' 'openssh')
backup=('etc/wemux/wemux.conf')
install='wemux.install'
md5sums=('c83c5ee88d3784d79449c05a8e55da70')
source=("https://github.com/zolrath/wemux/archive/v${pkgver}.zip")

package(){
  cd wemux-$pkgver
  install -dm755 $pkgdir/usr/share 

  sed -i -e "s|usr/local/etc|etc/wemux|g" ./wemux

  #install manpage
  install -Dm644  ./man/wemux.1 $pkgdir/usr/share/man/man1/wemux.1
  
  
  #install binary and readme
  install -Dm755  ./wemux $pkgdir/usr/bin/wemux
  install -Dm644  ./README.md $pkgdir/usr/share/wemux/README.md

  #install conf
  install -Dm644 ./wemux.conf.example $pkgdir/etc/wemux/wemux.conf 

  #install licence
  install -Dm644 ./MIT-LICENSE $pkgdir/usr/share/licenses/wemux/LICENSE

}

# vim:set ts=2 sw=2 et:
