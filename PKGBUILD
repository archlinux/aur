# Maintainer: Alexandr Boiko <brdcom@ya.ru>

pkgname=accel-ppp-ipoe-dkms
_pkgname=accel-ppp
pkgver=1.9.0
pkgrel=2
pkgdesc='Accel-ppp ipoe kernel module sources'
arch=('i686' 'x86_64')
url='http://sourceforge.net/apps/trac/accel-ppp/'
license=('GPL')
depends=('dkms' 'gcc' 'make')
provides=('accel-ppp-ipoe-module' 'accel-ppp-ipoe-module-lts')
optdepends=('linux-headers'
            'linux-lts-headers')
source=(http://sourceforge.net/projects/$_pkgname/files/$_pkgname-$pkgver.tar.bz2
        dkms.conf)

md5sums=('9b02c5c42ad939ea393811f97e844f54'
         'f29b9da24a881c3c42fb9abc0c7ddfe3')
    
install=accel-ppp-ipoe-dkms.install

package() {
    cd "$srcdir"
    install -dm755 "$pkgdir/usr/src"
    cd "$_pkgname-$pkgver/drivers"
    cp -r ipoe "$pkgdir/usr/src/accel-ppp-ipoe-$pkgver"
    install -Dm0644 "$srcdir/dkms.conf" "$pkgdir/usr/src/accel-ppp-ipoe-$pkgver/dkms.conf"
}

# vim:set ts=4 sw=4 et:
