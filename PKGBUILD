# Maintainer: Alexandr Boiko <brdcom@ya.ru>

pkgname=accel-ppp-ipoe-dkms
_pkgname=accel-ppp
pkgver=1.11.0
pkgrel=1
pkgdesc='Accel-ppp ipoe kernel module sources'
arch=('i686' 'x86_64')
url='http://sourceforge.net/apps/trac/accel-ppp/'
license=('GPL')
depends=('dkms' 'lua51')
conflicts=('accel-ppp-ipoe-dkms-git' 'accel-ppp-vlanmon-dkms-git')
source=(http://sourceforge.net/projects/$_pkgname/files/$_pkgname-$pkgver.tar.bz2
        dkms.conf)

package() {
    cd "$srcdir"
    install -dm755 "$pkgdir/usr/src"
    cd "$_pkgname-$pkgver/drivers"
    cp -r ipoe "$pkgdir/usr/src/accel-ppp-ipoe-$pkgver"
    install -Dm0644 "$srcdir/dkms.conf" "$pkgdir/usr/src/accel-ppp-ipoe-$pkgver/dkms.conf"
}

md5sums=('2a840be652604795a1cbba8d2c6cb7fe'
         'e760913b2eef629cbad23925b5645367')
