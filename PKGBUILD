# Maintainer: Atte Lautanala <atte.lautanala@gmail.com>
pkgname=phraseapp-client
pkgver=1.13.0
pkgrel=1
pkgdesc="PhraseApp CLI tool"
arch=('i686' 'x86_64')
url="https://phraseapp.com/cli"
license=('MIT')

source_i686=("phraseapp_linux_386-$pkgver.tar.gz::https://github.com/phrase/phraseapp-client/releases/download/$pkgver/phraseapp_linux_386.tar.gz")
source_x86_64=("phraseapp_linux_amd64-$pkgver.tar.gz::https://github.com/phrase/phraseapp-client/releases/download/$pkgver/phraseapp_linux_amd64.tar.gz")

sha256sums_i686=('a55337ac35fb571ea2a608520ac8d014157fc8e9404774254719d8074db9fb06')
sha256sums_x86_64=('375422767155c6ccd2aa2a94df6fa8d2caf307fb6176d74ba8e2bed4ce5c70e6')


package() {
  if [ $CARCH == 'i686' ]; then
    install -Dm0755 "$srcdir/phraseapp_linux_386" "$pkgdir/usr/bin/phraseapp"
  else
    install -Dm0755 "$srcdir/phraseapp_linux_amd64" "$pkgdir/usr/bin/phraseapp"
  fi
}
