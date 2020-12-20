# Maintainer: Michał Sidor (Michcioperz) <packages at meekchopp dot es>
pkgname=h2o-ai-bin
# this _ver mess is there to make it easier to understand how to update the version and how various updates affect the url
_ver1=3
_ver2=32
_ver3=0
# codename changes when one of the first three numbers changes
_vercodename=zermelo
_ver4=2
pkgver=$_ver1.$_ver2.$_ver3.$_ver4
source=("http://h2o-release.s3.amazonaws.com/h2o/rel-$_vercodename/$_ver4/h2o-$pkgver.zip"
        "h2o-ai.sh")
pkgrel=1
pkgdesc="Open source machine learning API"
arch=('x86_64')
url="https://www.h2o.ai/h2o/"
license=('Apache')
depends=('java-runtime>=7')

package() {
  cd $srcdir/h2o-$pkgver
  mkdir -p "$pkgdir/usr/share/java/h2o-ai"
  cp h2o.jar "$pkgdir/usr/share/java/h2o-ai"
  install -Dm755 $srcdir/h2o-ai.sh "$pkgdir/usr/bin/h2o-ai"
}

md5sums=('c693930952228bc885c35e4bbb2d98fd'
         'be58746df5ba4913ea335a3adc08814a')
