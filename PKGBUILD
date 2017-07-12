# Maintainer: Michał Sidor (Michcioperz) <packages at meekchopp dot es>
pkgname=h2o-ai-bin
# this _ver mess is there to make it easier to understand how to update the version and how various updates affect the url
_ver1=3
_ver2=10
_ver3=5
# codename changes when one of the first three numbers changes
_vercodename=vajda
_ver4=3
pkgver=$_ver1.$_ver2.$_ver3.$_ver4
source=("http://h2o-release.s3.amazonaws.com/h2o/rel-$_vercodename/$_ver4/h2o-$pkgver.zip"
        "h2o-ai.sh")
pkgrel=1
pkgdesc="Open source machine learning API"
arch=('x86_64')
url="https://www.h2o.ai/h2o/"
license=('Apache')
depends=('java-runtime>=7' 'java-runtime<9')

package() {
  cd $srcdir/h2o-$pkgver
  mkdir -p "$pkgdir/usr/share/java/h2o-ai"
  cp h2o.jar "$pkgdir/usr/share/java/h2o-ai"
  install -Dm755 $srcdir/h2o-ai.sh "$pkgdir/usr/bin/h2o-ai"
}

md5sums=('df964ded28cdbb8a1b0bfb6fcdd0c617'
         '008aadd36da7ad0d0b8a31a21ac3975d')
