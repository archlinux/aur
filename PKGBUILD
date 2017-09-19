# Maintainer: YesDay <yesdayuk[you know]gmail[you know]com>
pkgname=dracut-crypt-ssh
pkgver=1.0.3
pkgrel=1
pkgdesc="Dracut initramfs module to start dropbear sshd during boot to 
enter LUKS passphrase remotely"
arch=("i686" "x86_64" "aarch64")
url="https://github.com/dracut-crypt-ssh/dracut-crypt-ssh"
license=('GPL2')
depends=("dracut" "dhclient" "dropbear")
provides=("$pkgname-git")
conflicts=("$pkgname-git")
backup=("etc/dracut.conf.d/crypt-ssh.conf")
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

# Check target is not available.
# make: *** No rule to make target 'check'.
#check() {
#    cd "$pkgname-$pkgver"
#    make -k check
#}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
