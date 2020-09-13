# Contributor: Max Devaine <maxdevaine@gmail.com>

pkgname=tightvnc-jviewer
pkgver=2.8.3
pkgrel=1
pkgdesc='TightVNC java viewer'
arch=(i686 x86_64)
url='http://www.tightvnc.com'
license=('GPL2 + trilead-ssh2')
depends=('java-environment')
source=("tvnjviewer-${pkgver}-bin-gnugpl.zip::https://www.tightvnc.com/download/${pkgver}/tvnjviewer-${pkgver}-bin-gnugpl.zip"
        "tightvnc-jviewer"
        "tightvnc-jviewer-nossh")
md5sums=('7a862e325b82a53f7f86f39a7eb7237a'
         '2a8e2611a5e976444ec6ebcc7ebabd6f'
         '51f9bcd539864f2cba83fd32bc6d075a')

 package() {
    mkdir -p $pkgdir/opt/tightvnc-jviewer
    mkdir -p $pkgdir/usr/bin
    cp -r $srcdir/nossh $pkgdir/opt/tightvnc-jviewer/
    cp $srcdir/*.txt $pkgdir/opt/tightvnc-jviewer/
    install -m644 $srcdir/tightvnc-jviewer.jar $pkgdir/opt/tightvnc-jviewer/
    install -m755 $srcdir/tightvnc-jviewer $pkgdir/opt/tightvnc-jviewer/
    install -m755 $srcdir/tightvnc-jviewer-nossh $pkgdir/opt/tightvnc-jviewer/
    cd $pkgdir
    ln -s /opt/tightvnc-jviewer/tightvnc-jviewer $pkgdir/usr/bin/tightvnc-jviewer
    ln -s /opt/tightvnc-jviewer/tightvnc-jviewer-nossh $pkgdir/usr/bin/tightvnc-jviewer-nossh
}
