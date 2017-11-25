# Maintainer: Alexander Agura <agur4ik09@gmail.com>
pkgname=paccache-systemd
pkgver=0.1
pkgrel=1
pkgdesc="Clear pacman cache systemd timer, remove all uninstalled pkgs from cache, leave up to 3 versions of installed"
arch=('any')
license=('custom:WTFPL')
depends=('pacman')
backup=('usr/lib/systemd/system/paccache.service'
        'usr/lib/systemd/system/paccache.timer')
install='paccache.install'
source=('paccache.service' 'paccache.timer')
md5sums=('5587bd4de1c4cf09896369eb6f07447e'
         'cde9806f441b30aa96aa8180a627ee13')

package() {
	mkdir -p $pkgdir/usr/lib/systemd/system/
	#mv LICENSE usr/share/licenses/$pkgname/
	cp -a paccache.{service,timer} $pkgdir/usr/lib/systemd/system/
}
