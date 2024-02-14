# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=nweb
pkgver=25
pkgrel=1
pkgdesc='Tiny web server for serving static pages'
arch=('x86_64' 'i686')
url='https://nmon.sourceforge.io/pmwiki.php?n=Site.Nweb'
license=('custom')
depends=(glibc)
source=(https://sourceforge.net/projects/nmon/files/nweb${pkgver}.c)
sha256sums=('5f22d4b27854a3a08fed21c46d68f49b3a2ee666cd9c5664705ace3f047b3553')


prepare() {
  curl "https://nmon.sourceforge.io/pmwiki.php?n=Site.Nweb" | grep license > LICENSE
}

build() {
  gcc -std=c11 -O3 -DLINUX nweb${pkgver}.c -o nweb -w
}

package() {
  install -Dm755 nweb "$pkgdir/usr/bin/nweb"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
