# Maintainer: Swift Geek
pkgname=altermime
pkgver=0.3.10
pkgrel=0
pkgdesc="MIME encoded email pack alteration tool"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="http://www.pldaniels.com/altermime/"
license=('BSD')
depends=('glibc')
source=("http://www.pldaniels.com/altermime/altermime-${pkgver}.tar.gz"
        "altermime-0.3.10-fprintf-compiler-error.patch"
        "altermime-0.3.10-cflags.patch")
md5sums=('aaf0ad8029958a2dc6da3abb4dc178c2'
         '4b8ce1a5878e595db6fdec8bb2bc3871'
         '194efdd0f1cc15e0b8a3f7bbf8b2acd3')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  patch -Np0 -i "${srcdir}/altermime-0.3.10-fprintf-compiler-error.patch"
  patch -Np0 -i "${srcdir}/altermime-0.3.10-cflags.patch"
}

build() {
   cd "$srcdir/${pkgname}-${pkgver}"
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -d "$pkgdir/usr/bin/"
  install -m 755 altermime "$pkgdir/usr/bin/"
  install -d "$pkgdir/usr/share/licenses/altermime"
  install -m 644 LICENCE "$pkgdir/usr/share/licenses/altermime"

}
