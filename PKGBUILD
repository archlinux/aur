# Maintainer: Tetsumi <tetsumi@vmail.me>

pkgname=golo
pkgver=3.2.0.M4
_filename=golo-3.2.0-M4
pkgrel=1
pkgdesc="A lightweight dynamic language for the JVM."
arch=(any)
url="http://golo-lang.org/"
license=(EPL)
depends=(java-runtime-headless bash)
makedepends=('unzip')
options=(!strip)
noextract=("${_filename}.zip")
source=(http://mirror.dkm.cz/eclipse/golo/${_filename}.zip)
md5sums=('1df3821973a5cf1994f82a307da7eef5')

package() {
  cd "$pkgdir"

  mkdir opt
  #bsdtar -C opt -xf "$srcdir/${_filename}"
  unzip $srcdir/${_filename}.zip -d opt
  mv opt/${_filename} opt/golo
  
  find opt/golo -regextype posix-extended -regex '.*\.(bat|dll|exe)' -delete

  mkdir -p usr/bin
  
  ln -s ../../opt/golo/bin/golo usr/bin/golo
  ln -s ../../opt/golo/bin/vanilla-golo usr/bin/vanilla-golo

  mkdir -p usr/share/licenses/$pkgname
  ln -s ../../../../opt/golo/epl-v10.html usr/share/licenses/$pkgname/LICENSE
}
 
