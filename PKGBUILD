# Maintainer: Cedric Meury <cedric@meury.com>
pkgname=uchiwa
pkgver=1.1.3
pkgrel=2
pkgdesc="A simple dashboard for the Sensu monitoring framework, built with Go and AngularJS."
arch=('x86_64' 'i686')
url="https://www.uchiwa.io/"
license=('MIT')
install="${pkgname}.install"
depends=('python2' 'bash')
options=('emptydirs')
source_i686=("http://dl.bintray.com/palourde/uchiwa/uchiwa-${pkgver}-${pkgrel}.i386.rpm")
source_x86_64=("http://dl.bintray.com/palourde/uchiwa/uchiwa-${pkgver}-${pkgrel}.x86_64.rpm")
source=('LICENSE'
        'uchiwa.service')

md5sums_i686=('c1c563b95c5f305c1445f6ee463f2f23')
md5sums_x86_64=('875480ad3870f4f0f41b7036bafb70d9')
md5sums=('598261aece4dcb18f35ce5435b652d8a'
        'a7222f9eac2a36b5e5c27a7377831dc5')

package() {
    rm $srcdir/opt/uchiwa/bin/.keep
    rm $srcdir/opt/uchiwa/src/.keep
    rm $srcdir/etc/sensu/dashboard.d/.keep
    rm $srcdir/etc/default/uchiwa
    rm -rf $srcdir/etc/default
    rm $srcdir/etc/init.d/uchiwa
    rm -rf $srcdir/etc/init.d

    cp -R $srcdir/* $pkgdir
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}

