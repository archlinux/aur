# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=canu-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="A fork of the Celera Assembler designed for high-noise single-molecule sequencing"
arch=('x86_64')
url="https://canu.readthedocs.io/"
license=('custom')
depends=('glibc' 'java-runtime' 'perl')
provides=('canu')
conflicts=('canu')
options=('staticlibs')
source=("https://github.com/marbl/canu/releases/download/v$pkgver/canu-$pkgver.Linux-amd64.tar.xz")
sha256sums=('b6aa11c00b8b4114d32dd12107b0134c5f01cbc3c7751b07e603bb51f23d6766')


package() {
  cd "canu-$pkgver"

  install -Dm755 "bin"/* -t "$pkgdir/usr/bin"
  install -Dm644 "lib/site_perl/canu"/*.pm -t "$pkgdir/usr/lib/site_perl/canu"
  install -Dm644 "share/java/classes"/*.jar -t "$pkgdir/usr/share/java/classes"
  install -Dm644 "lib"/*.a -t "$pkgdir/usr/lib"

  install -Dm644 "README.licenses" -t "$pkgdir/usr/share/licenses/canu"
}
