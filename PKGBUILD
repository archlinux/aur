# Maintainer: Laurent Jourden <laurent85@enarel.fr>

pkgname=archuseriso
pkgver=0.4.4
pkgrel=1
pkgdesc="Templates for building Arch Linux Live ISO images. Featuring persistence, encryption."
arch=('any')
url="https://github.com/laurent85v/archuseriso"
license=('GPL')
depends=('archiso' 'syslinux')
conflicts=('archuseriso')
install=archuseriso.install
source=("http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "http://dl.gnutux.fr/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('cf81b191b69100b4652dc333eff6e629f250a6cb2aa3fbb88ee4fd16aa2ff62ea69ca49bac9acb941551d77576049a62c6966878bfabab051442b20e54f863ca'
            'SKIP')
validpgpkeys=('A5143BB56952B3189F49A175FAC4560863BEEC34') # Laurent Jourden

package() {
    make -C "${pkgname}-${pkgver}" DESTDIR="$pkgdir" install
}
