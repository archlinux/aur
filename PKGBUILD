# Maintainer: Rod Kay <charlie5 on #ada at irc.libera.chat>

pkgname=inotify-ada
pkgver=20220727
pkgrel=1

pkgdesc='An Ada 2012 library to monitor filesystem events using the Linux inotify API.'
url='https://github.com/onox/inotify-ada'
arch=('i686' 'x86_64')
license=('Apache License 2.0')

depends=('gcc-ada' 'alire')
makedepends=('gprbuild')

source=("https://github.com/onox/inotify-ada/archive/refs/heads/master.zip")
sha256sums=("42c1b785c148ca7c68dd8eb14b990b7b22d1812df2047e7064303496c3f42ac7")


build()
{
    cd $srcdir/$pkgname-master
    make build
}


package()
{
    cd $srcdir/$pkgname-master
 
    mkdir -p    $pkgdir/usr/bin
    make PREFIX=$pkgdir/usr install
    
    gprinstall -P inotify.gpr -p --prefix=$pkgdir/usr
}
