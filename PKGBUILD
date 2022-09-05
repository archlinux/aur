# Maintainer: Rod Kay <charlie5 on #ada at irc.libera.chat>

pkgname=inotify-ada
pkgver=20220905
pkgrel=1

pkgdesc='An Ada 2012 library to monitor filesystem events using the Linux inotify API.'
url='https://github.com/onox/inotify-ada'
arch=('i686' 'x86_64')
license=('Apache License 2.0')

depends=('gcc-ada' 'alire')
makedepends=('gprbuild')

source=("https://github.com/onox/inotify-ada/archive/refs/tags/v2.0.1.tar.gz")
sha256sums=("49362b9ea81718a3c5385d0b6eccdd55fcce26f897a0eb887fd657c84ad3bf79")


build()
{
    cd $srcdir/$pkgname-2.0.1

    alr build --validation

    gprbuild inotify.gpr
    gprbuild monitor.gpr
}


package()
{
    cd $srcdir/$pkgname-2.0.1

    gprinstall -P inotify.gpr -p --prefix=$pkgdir/usr
    gprinstall -P monitor.gpr -p --prefix=$pkgdir/usr
}