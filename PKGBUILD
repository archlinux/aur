# Maintainer: Tetsumi <tetsumi@vmail.me>

pkgname=golo
pkgver=3.0.0.incubation.M2
pkgrel=1
pkgdesc="A lightweight dynamic language for the JVM."
arch=(any)
url="http://golo-lang.org/"
license=(EPL)
depends=(java-runtime-headless bash)
makedepends=('unzip')
options=(!strip)
noextract=("golo-${pkgver}-distribution.tar.gz")
source=(http://ftp.snt.utwente.nl/pub/software/eclipse//golo/golo-3.0.0-incubation-M2.zip)
md5sums=('bcba7ff10a93a4f59bea500ae0a430aa')

package() {
  cd "$pkgdir"

  mkdir opt
  bsdtar -C opt -xf "$srcdir/golo-${pkgver}-distribution.tar.gz"
  mv opt/golo-$pkgver opt/golo
  
  find opt/golo -regextype posix-extended -regex '.*\.(bat|dll|exe)' -delete

  mkdir -p usr/bin
  
  ln -s ../../opt/golo/bin/golo usr/bin/golo
  ln -s ../../opt/golo/bin/vanilla-golo usr/bin/vanilla-golo

  mkdir -p usr/share/licenses/$pkgname
  ln -s ../../../../opt/golo/epl-v10.html usr/share/licenses/$pkgname/LICENSE
}
 
