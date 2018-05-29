# Maintainer: Alexander Agura <agur4ik09@gmail.com>
pkgname=paccache-systemd
pkgver=0.2
pkgrel=1
pkgdesc="Clear pacman cache systemd timer, remove all uninstalled pkgs from cache, leave up to 3 versions of installed"
arch=('any')
license=('custom:WTFPL')
depends=('pacman' 'pacman-contrib')
backup=('usr/lib/systemd/system/paccache-leave3.service'
        'usr/lib/systemd/system/paccache-leave3.timer')
install='paccache.install'
source=('paccache-leave3.service' 'paccache-leave3.timer')
md5sums=('7bbe46f2262763e844dd344c8c2ea591'
         'd2079f00daa9d4112e4678e500645967')

package() {
	mkdir -p $pkgdir/usr/lib/systemd/system/
	#mv LICENSE usr/share/licenses/$pkgname/
	cp paccache.{service,timer} $pkgdir/usr/lib/systemd/system/
}
