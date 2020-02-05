# Contributor: $pooky Hunter <spookyh+arch@gmail.org>

pkgname=apt-mirror
pkgver=0.5.4
pkgrel=2
pkgdesc="APT sources mirroring tool"
arch=('i686' 'x86_64')
url="https://apt-mirror.github.io/"
license=('GPL')
depends=('perl')
source=(http://ftp.de.debian.org/debian/pool/main/a/apt-mirror/apt-mirror_$pkgver.orig.tar.xz)
md5sums=('3935851c7822f671b8ce7fd694bc9282')
backup=('etc/apt/mirror.list' 'etc/apt/mirror_jessie.list')

package() {
    cd $srcdir/$pkgname-$pkgver
    install -d ${pkgdir}/etc/apt
    install -d ${pkgdir}/usr/bin
    install -d ${pkgdir}/var/spool/apt-mirror/{var,skel,mirror}
    install -m755 $srcdir/$pkgname-$pkgver/apt-mirror ${pkgdir}/usr/bin/
}
