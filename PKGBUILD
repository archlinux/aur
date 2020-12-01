# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.5.4
pkgrel=1
pkgdesc="Profiles for building Arch Linux Live ISO images. Featuring persistence, encryption."
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL3')
depends=('arch-install-scripts' 'bash' 'dosfstools' 'e2fsprogs' 'libisoburn' 'mtools' 'squashfs-tools' 'syslinux')
optdepends=('devtools: ZFS build option'
            'f2fs-tools: F2FS file system option'
            'pacman-contrib: ZFS build option')
conflicts=('archuseriso')
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha256sums=('2df6ed0f3843779b9ffd3d06e4320843b3d01cf105aa3cc0f0c1488239b70255'
            'SKIP')
b2sums=('00be5e6314879a8ee06a97d42ac858dec4a58f7797fd29da1c68eee5a00b7ff7a392c9229cef6de73cc92ace78e0e6770e19c1ffea99405a1bffd2146e84692d'
        'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
