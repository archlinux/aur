# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: E100

### THIS PACKAGE IS NOT REQUIRED TO RUN STEAM, INSTALL THE NOSYSTEMD VERSIONS OF STEAM DEPENDENCIES ###

_spkgrel=1
_repo=http://mirror.chaoticum.net/arch/multilib/os
pkgname=lib32-libsystemd.so
pkgver=246.6
pkgrel=1
arch=('x86_64')
license=('GPL2')
url="http://www.freedesktop.org/wiki/Software/systemd"
source=("$_repo/x86_64/lib32-systemd-$pkgver-${_spkgrel}-x86_64.pkg.tar.zst")
sha256sums=('SKIP')
pkgdesc="systemd client libraries without udev; systemd compatibility package"
provides=('lib32-systemd' 'lib32-systemd.so' 'lib32-libsystemd.so')
depends=('lib32-glibc' 'lib32-libcap' 'lib32-libgcrypt' 'lib32-xz' 'lib32-eudev')
conflicts=('lib32-systemd' 'eudev-systemdcompat')

package() {
    install -d $pkgdir/usr/lib32
    for f in usr/lib32/libsystemd*.so*;do
        mv -v $f $pkgdir/usr/lib32
    done
}

