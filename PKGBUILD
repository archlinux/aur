pkgname=libxml2-so.2-compat
pkgver=2.13.8
pkgrel=1
pkgdesc="Legacy libxml2.so.2.13.8 symlinked as libxml2.so.2 for Unity compatibility"
arch=('x86_64')
url=
license=('MIT')
provides=('libxml2.so.2')
conflicts=()
options=(!strip)
source=("https://archive.archlinux.org/packages/l/libxml2/libxml2-${pkgver}-1-x86_64.pkg.tar.zst")
noextract=("libxml2-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('SKIP')
 
package() {
  mkdir -p "$pkgdir/usr/lib"
  bsdtar -xf "${srcdir}/libxml2-${pkgver}-1-x86_64.pkg.tar.zst" -C "${srcdir}" $"usr/lib/libxml2.so.${pkgver}"
  install -m 755 "${srcdir}/usr/lib/libxml2.so.${pkgver}" "$pkgdir/usr/lib/libxml2.so.${pkgver}"
  ln -sf $"libxml2.so.${pkgver}" "$pkgdir/usr/lib/libxml2.so.2"
}
