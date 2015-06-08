# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=apache-ant-antro
pkgver=0.52
pkgrel=1
pkgdesc="A line-level profiler for Ant build scripts"
arch=('any')
url="http://sourceforge.net/projects/antro/"
license=( 'GPL2' )
depends=( 'apache-ant' 'bash' )
source=( "http://downloads.sourceforge.net/project/antro/antro/antro%20$pkgver/antro-$pkgver.zip"
         "antro" )
sha1sums=('393e8db3114f8f45f8f0144ee06d4f1ced181bfb'
          'ea8849b9228d583ab64c3c4985f575f68de11695')

build() { 
  mkdir -p "$pkgdir"/usr/share/java/apache-{ant,antro}/
  cp -r "$srcdir"/* "$pkgdir"/usr/share/java/apache-antro/
  rm -fr "$pkgdir"/usr/share/java/apache-antro/src \
         "$pkgdir"/usr/share/java/apache-antro/*.zip
  ln -s ../apache-antro/antro.jar $pkgdir/usr/share/java/apache-ant/
  install -Dm755 "$srcdir"/antro "$pkgdir"/usr/bin/antro
  find "$pkgdir" -name ant.jar -delete
}

# vim:set ts=2 sw=2 et:
