# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=canu-bin
pkgver=2.3
pkgrel=1
pkgdesc="A fork of the Celera Assembler designed for high-noise single-molecule sequencing"
arch=('x86_64')
url="https://canu.readthedocs.io/"
license=('LicenseRef-canu')
depends=('gcc-libs' 'java-runtime' 'perl')
optdepends=('gnuplot')
provides=("canu=$pkgver")
conflicts=('canu')
options=('staticlibs')
source_x86_64=("https://github.com/marbl/canu/releases/download/v$pkgver/canu-$pkgver.Linux-amd64.tar.xz")
sha256sums_x86_64=('9a6aeec0be0d753e8fc87bc285c92c4d2aca1cc2341c54df68945308b9ca9763')


package() {
  cd "canu-$pkgver"

  install -Dm755 "bin"/* -t "$pkgdir/usr/bin"
  install -Dm644 "lib/perl5/site_perl/canu"/*.pm -t "$pkgdir/usr/lib/site_perl/canu"
  install -Dm644 "share/java/classes"/*.jar -t "$pkgdir/usr/share/java/classes"
  install -Dm644 "lib"/*.a -t "$pkgdir/usr/lib"

  install -Dm644 "README.licenses" -t "$pkgdir/usr/share/licenses/canu"
}
