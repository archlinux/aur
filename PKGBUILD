# Maintainer: Lesto <bifrost AT hotmail DOT it>
pkgname=freedns-daemon
pkgver=2
pkgrel=1
pkgdesc="Lighweight, barebone and almost dependency free daemon for freedns.afraid.org"
arch=('any')
url="http://www.github.com/lestofante/freedns"
license=('GPL')
depends=('curl' 'bash')
makedepends=()
install='freedns-daemon.install'
backup=('usr/bin/freedns-daemon.sh')
changelog=
source=(freedns-daemon.sh freedns-daemon.service freedns-daemon.install)
noextract=(freedns-daemon.sh freedns-daemon.service freedns-daemon.install)
md5sums=('6293f163b0562c98ff347e2c86b61f56'
	 '8ef7bb67f76b0eb6283f3576bb621b53'
	 'ee469778558ba68efd813611821f88c6')


build() {
	cd "$srcdir"
	chmod +x ./freedns-daemon.sh
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin"
  cp freedns-daemon.sh "$pkgdir/usr/bin/"
  
  mkdir -p "$pkgdir/etc/freedns-daemon/"
  echo '#place here your direct url, should be something similar to "http://freedns.afraid.org/dynamic/update.php?BLABLABLABALBALdasdsadas=="' > "$pkgdir/etc/freedns-daemon/urls"
  
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  cp freedns-daemon.service "$pkgdir/usr/lib/systemd/system/"
}