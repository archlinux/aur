# Contributor: $pooky Hunter <spookyh+arch@gmail.org>

pkgname=apt-mirror
pkgver=0.5.2
pkgrel=1
pkgdesc="APT sources mirroring tool"
arch=('i686' 'x86_64')
url="https://apt-mirror.github.io/"
license=('GPL')
depends=('perl')
makedepends=('')
source=(http://ftp.de.debian.org/debian/pool/main/a/apt-mirror/apt-mirror_$pkgver.orig.tar.xz)
md5sums=('4a5c552630ecb8e1bf6460340d79cb1a')
backup=('etc/apt/mirror.list' 'etc/apt/mirror_jessie.list')

package() {
    cd $srcdir/$pkgname-$pkgver
    install -d ${pkgdir}/etc/apt
    install -d ${pkgdir}/usr/bin
    install -d ${pkgdir}/var/spool/apt-mirror/{var,skel,mirror}
    install -m755 $srcdir/$pkgname-$pkgver/apt-mirror ${pkgdir}/usr/bin/
}
