# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=canu-bin
pkgver=2.2
pkgrel=2
pkgdesc="A fork of the Celera Assembler designed for high-noise single-molecule sequencing"
arch=('x86_64')
url="https://canu.readthedocs.io/"
license=('custom')
depends=('glibc' 'java-runtime' 'perl')
optdepends=('gnuplot')
provides=("canu=$pkgver")
conflicts=('canu')
options=('staticlibs')
source_x86_64=("https://github.com/marbl/canu/releases/download/v$pkgver/canu-$pkgver.Linux-amd64.tar.xz")
sha256sums_x86_64=('0e98d10d8216e99091d999d0b4c6b11a045515932e6cc48fcb2c8435aa688bdf')


package() {
  cd "canu-$pkgver"

  install -Dm755 "bin"/* -t "$pkgdir/usr/bin"
  install -Dm644 "lib/site_perl/canu"/*.pm -t "$pkgdir/usr/lib/site_perl/canu"
  install -Dm644 "share/java/classes"/*.jar -t "$pkgdir/usr/share/java/classes"
  install -Dm644 "lib"/*.a -t "$pkgdir/usr/lib"

  install -Dm644 "README.licenses" -t "$pkgdir/usr/share/licenses/canu"
}
