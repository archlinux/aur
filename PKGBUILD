#Maintainer: KlarkKable <KlarkKable at protonmail dot com>
pkgname=dart-sdk-dev
pkgver=2.0.0_dev.55.0
pkgrel=1
pkgdesc="The official Dart sdk from dart-lang project (Development branch)"
arch=('x86_64')
url="https://www.dartlang.org/tools/sdk/archive"
license=('custom')
depends=('unzip')
conflicts=('dart')
source=("https://storage.googleapis.com/dart-archive/channels/dev/release/${pkgver//_/-}/sdk/dartsdk-linux-x64-release.zip")
sha256sums=('83122eda055830c6c9c10e85467bdcdda273244c9e69b412a8769221f2fb16aa')

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
