pkgname=phraseapp-client
pkgver=1.7.4
pkgrel=1
pkgdesc="PhraseApp CLI tool"
arch=('i686' 'x86_64')
url="https://phraseapp.com/cli"
license=('MIT')

source_i686=("phraseapp_linux_386-$pkgver.tar.gz::https://github.com/phrase/phraseapp-client/releases/download/$pkgver/phraseapp_linux_386.tar.gz")
source_x86_64=("phraseapp_linux_amd64-$pkgver.tar.gz::https://github.com/phrase/phraseapp-client/releases/download/$pkgver/phraseapp_linux_amd64.tar.gz")

sha256sums_i686=('60c33269d839c75728672c7f809dd5cc91559a6d967b236155cb89be981bd28e')
sha256sums_x86_64=('1cabfc4f23dc9f30f23d62d68c3cfdf57ad98eec04cf968900a0d0482a1120c3')

package() {
  if [ $CARCH == 'i686' ]; then
    install -Dm0755 "$srcdir/phraseapp_linux_386" "$pkgdir/usr/bin/phraseapp"
  else
    install -Dm0755 "$srcdir/phraseapp_linux_amd64" "$pkgdir/usr/bin/phraseapp"
  fi
}
