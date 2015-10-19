# Contributor: Michael Manley <mmanley@nasutek.com>
# Contributor: Patrick CRESSANT <pcressant@yahoo.fr>
# Contributor: Konstantin Oblaukhov <obko@mail.ru>

# Rinse RPM Distro Bootstrapper

pkgname=rinse
pkgver=3.0.2
pkgrel=2
pkgdesc="Bootstrap a rpm based distribution like debootstrap"
arch=('any')
url="http://collab-maint.alioth.debian.org/rinse/"
license=('GPL')
groups=()
depends=('glibc' 'perl' 'perl-html-parser' 'perl-uri' 'perl-libwww' 'rpm2cpio' 'wget' 'rpm' 'cpio')
makedepends=('make')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/rinse/rinse.conf')
options=()
install=
source=("http://collab-maint.alioth.debian.org/rinse/download/rinse_3.0.2.tar.gz"
        "sbin.patch")
noextract=()
md5sums=('51c7875ae363ed35963e3b9fad344dd1'
         'a9f0c264fa8b2427bc7e327a632a2b0d')

prepare() {
  patch -p0 -i $srcdir/sbin.patch 
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX="$pkgdir/" sbindir="$pkgdir/bin" install
}
 
