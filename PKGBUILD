#Maintainer: KlarkKable <KlarkKable at protonmail dot com>
pkgname=dart-sdk-dev
pkgver=2.0.0_dev.50.0
pkgrel=1
pkgdesc="The official Dart sdk from dart-lang project (Development branch)"
arch=('x86_64')
url="https://www.dartlang.org/tools/sdk/archive"
license=('custom')
depends=('unzip')
conflicts=('dart')
source=("https://storage.googleapis.com/dart-archive/channels/dev/release/${pkgver//_/-}/sdk/dartsdk-linux-x64-release.zip")
sha256sums=('0ac31f14ea073756c410123372e77005874235fecff324a5a702f15059278dca')

package() {
  # Uncompressed name is "dart-sdk" not "dart-sdk-dev"
  cd $srcdir/dart-sdk

  # Install Application
  install -d $pkgdir/{opt/$pkgname,usr/bin}
  cp -a . $pkgdir/opt/$pkgname
  ln -s /opt/$pkgname/bin/* $pkgdir/usr/bin/

  chmod -R ugo+rX $pkgdir/opt
  
  printf "\n#################################### \n\n"
  printf "\tMake sure to add '/opt/dart-sdk-dev/bin' to your PATH!\n"
  printf "\n#################################### \n\n"
}
