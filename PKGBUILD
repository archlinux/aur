pkgname=phraseapp-client
pkgver=1.9.1
pkgrel=1
pkgdesc="PhraseApp CLI tool"
arch=('i686' 'x86_64')
url="https://phraseapp.com/cli"
license=('MIT')

source_i686=("phraseapp_linux_386-$pkgver.tar.gz::https://github.com/phrase/phraseapp-client/releases/download/$pkgver/phraseapp_linux_386.tar.gz")
source_x86_64=("phraseapp_linux_amd64-$pkgver.tar.gz::https://github.com/phrase/phraseapp-client/releases/download/$pkgver/phraseapp_linux_amd64.tar.gz")

sha256sums_i686=('3e56d70e3728ded9dd4f48152ac43b75b56b7153a2e44aa836d8bdf6b4479f22')
sha256sums_x86_64=('b4da45c52b736b07db5442dcec0914ad510f3223124fb7e15132e0c9b292dba4')

package() {
  if [ $CARCH == 'i686' ]; then
    install -Dm0755 "$srcdir/phraseapp_linux_386" "$pkgdir/usr/bin/phraseapp"
  else
    install -Dm0755 "$srcdir/phraseapp_linux_amd64" "$pkgdir/usr/bin/phraseapp"
  fi
}
