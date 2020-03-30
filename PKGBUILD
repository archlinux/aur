# Maintainer: Atte Lautanala <atte.lautanala@gmail.com>
pkgname=phraseapp-client
pkgver=1.17.0
pkgrel=1
pkgdesc="PhraseApp CLI tool"
arch=('i686' 'x86_64')
url="https://phraseapp.com/cli"
license=('MIT')

source_i686=("phraseapp_linux_386-$pkgver.tar.gz::https://github.com/phrase/phraseapp-client/releases/download/$pkgver/phraseapp_linux_386.tar.gz")
source_x86_64=("phraseapp_linux_amd64-$pkgver.tar.gz::https://github.com/phrase/phraseapp-client/releases/download/$pkgver/phraseapp_linux_amd64.tar.gz")

sha256sums_i686=('29960f4381c0a2622a2167876e23e0634fc5ced40c2efc39c2e1fe981499dc40')
sha256sums_x86_64=('bf5785c6fb6b243a1f1d2436f92c645ea7f0a689dfdc8501ccf966af623b2f1b')


package() {
  if [ $CARCH == 'i686' ]; then
    install -Dm0755 "$srcdir/phraseapp_linux_386" "$pkgdir/usr/bin/phraseapp"
  else
    install -Dm0755 "$srcdir/phraseapp_linux_amd64" "$pkgdir/usr/bin/phraseapp"
  fi
}
