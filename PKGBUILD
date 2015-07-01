# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Marco Lima <cipparello@gmail.com>

pkgname=vboxtool
pkgver=0.5
pkgrel=1
pkgdesc="Provides effective control of VirtualBox VM on a Linux headless server"
arch=(any)
url=http://$pkgname.sourceforge.net
license=(GPL3)
depends=(rsync)
optdepends=("virtualbox_bin: VirtualBox")
backup=(etc/conf.d/$pkgname.conf)
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.zip
    $pkgname
    $pkgname.conf)
sha256sums=('8c5f006bbb08142d9babfce47db4ba5ba641cfe3aa88b1489e67c219460ace93'
    '904dbf63f2972e35d649429d34108802c64216cef0e98e721395655eacac3476'
    '099c2b10b0ce3db9c68e1dd483141b5a54ae35ee8ddacb8c30e8d50578ffce17')
sha512sums=('5380c4b7f4f8b08b8960bc67e6d0dd43dd2b7efe7f66534b948688cfa4835718108e2e312555c725078f05e563814fea84c9a32ad5324fa7b9d1057e1b987d21'
    '66cd7d112dff39445353dd4367a7b8030a5b59cd95c37b4185d886b624a7204de034b76d8972e93d709cfd11f79da385c4ab9ad94e7c912af60d1008326f07f6'
    '4245edaebfac678d1132b00fb0d8ec2d46610cc569fc5eacf7a6194bf995ed287f67ee01d846203c1ed5e92f9a74b28d0b9a4a00264f8dd0920275db12381049')

package() {
    cd "$srcdir"

    install -Dm755 script/$pkgname "$pkgdir"/usr/bin/$pkgname

    # archified version of the original init script
    install -Dm755 $pkgname "$pkgdir"/etc/rc.d/$pkgname
    install -Dm644 $pkgname.conf "$pkgdir"/etc/conf.d/$pkgname.conf

    # docs
    install -d "$pkgdir"/usr/share/doc/$pkgname
    install -m644 -t "$pkgdir"/usr/share/doc/$pkgname \
        script/vboxtoolinit changelog.txt readme.txt
}
