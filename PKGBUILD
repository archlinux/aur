# Maintainer: Alexandr Boiko <brdcom@ya.ru>

pkgname=accel-ppp-ipoe-dkms
_pkgname=accel-ppp
pkgver=1.10.2
pkgrel=4
pkgdesc='Accel-ppp ipoe kernel module sources'
arch=('i686' 'x86_64')
url='http://sourceforge.net/apps/trac/accel-ppp/'
license=('GPL')
depends=('dkms' 'gcc' 'make' 'lua51')
conflicts=('accel-ppp-ipoe-dkms-git' 'accel-ppp-vlanmon-dkms-git')
optdepends=('linux-headers: build modules against Arch kernel'
            'linux-lts-headers: build modules against LTS kernel')
source=(http://sourceforge.net/projects/$_pkgname/files/$_pkgname-$pkgver.tar.bz2
        dkms.conf)

md5sums=('31f8408691b67e1504e31b6773d2d9d1'
         'e760913b2eef629cbad23925b5645367')

package() {
    cd "$srcdir"
    install -dm755 "$pkgdir/usr/src"
    install -dm755 "$pkgdir/usr/lib/modules-load.d"
    cd "$_pkgname-$pkgver/drivers"
    cp -r ipoe "$pkgdir/usr/src/accel-ppp-ipoe-$pkgver"
    install -Dm0644 "$srcdir/dkms.conf" "$pkgdir/usr/src/accel-ppp-ipoe-$pkgver/dkms.conf"
}

# vim:set ts=4 sw=4 et:
