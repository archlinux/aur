# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Ali Gündüz <gndz.ali@gmail.com>

pkgname=ps_mem
pkgver=3.14
pkgrel=2
pkgdesc="List processes by memory usage"
arch=('any')
url="https://github.com/pixelb/ps_mem"
license=('GPL')
depends=('python')
#makedepends=('git')
#source=("${pkgname}::git+https://github.com/pixelb/${pkgname}.git#commit=bfc18bf3d2af0e04")
#sha256sums=('SKIP')
# author appears to be doing real releases now
source=("$pkgname-$pkgver.tgz::https://github.com/pixelb/ps_mem/archive/v$pkgver.tar.gz")
sha256sums=('ad8bf87f9b9acd9b0b4997445bd99a8eeace4d816b207d56b03c5a83fec00514')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 755 ps_mem.py "${pkgdir}/usr/bin/${pkgname}"
  install -D -m 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -D -m 644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

