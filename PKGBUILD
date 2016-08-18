# Maintainer: Brendan Abolivier <brendan@cozycloud.cc>
pkgname=welcome-home
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="Let your computer welcome you with music"
arch=("any")
url="https://github.com/babolivier/welcome-home"
license=("AGPL3")
groups=()
depends=("mopidy")
provides=("welcomehome")
backup=()
changelog=
source=("https://github.com/babolivier/welcome-home/archive/v$pkgver.tar.gz")
sha256sums=("c86cfd9ca41c8cfbdb54594c2c9ac63cc8aad103675b17a3ff9cdfc9164231e6")

package() {
	cd welcome-home-$pkgver

    mkdir -p $pkgdir/etc/welcomehome/
    mkdir -p $pkgdir/usr/local/bin/
    mkdir -p $pkgdir/etc/systemd/system

    mv welcomehome $pkgdir/usr/local/bin
    mv welcomehome.example.conf $pkgdir/etc/welcomehome/
    mv welcomehome.service $pkgdir/etc/systemd/system

    msg "Install complete, now you just have to edit /etc/welcomehome/welcomehome.example.conf and rename it to welcomehome.conf"
    msg "Then run sudo \"systemctl start welcomehome\""
}
