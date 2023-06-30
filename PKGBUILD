# Maintainer: robertfoster

pkgname=g4l
pkgver=0.63
pkgrel=1
pkgdesc="Ghost 4 Linux is a hard disk and partition imaging and cloning tool."
arch=('any')
url="http://freecode.com/projects/g4l/"
license=('GPL')
depends=('bzip2' 'ddrescue' 'dd_rhelp' 'dialog' 'fsarchiver' 'gzip' 'lzop' 'ncurses' 'partimage' )
source=("http://fossies.org/linux/misc/${pkgname}-v${pkgver}.devel.tar.gz")
noextract=(${pkgname}-v${pkgver}.devel.tar.gz)
makedepends=(wget)

package() {
    cd $srcdir
    tar -zxvf ${pkgname}-v${pkgver}.devel.tar.gz -C $srcdir bootcd/rootfs
    tar -zxvf ${pkgname}-v${pkgver}.devel.tar.gz -C $srcdir resources/jetcat
    mkdir -p $pkgdir/usr/bin/
    mv $srcdir/bootcd/rootfs/{*g4l,g4l3*} $pkgdir/usr/bin/
    mkdir -p $pkgdir/mnt/local
    cd resources/jetcat/

    install -c -s -m755 jetcat-mod $pkgdir/usr/bin
    install -c -s -m755 jetcat-mod8 $pkgdir/usr/bin
}

sha256sums=('85752f64ee83a31074ded10f9c0f7f2e1b1a852ab5acc9dc0bba5b25b896832b')
