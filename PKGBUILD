# Maintainer: Atte Lautanala <atte.lautanala@gmail.com>
pkgname=phraseapp-client
pkgver=1.16.0
pkgrel=1
pkgdesc="PhraseApp CLI tool"
arch=('i686' 'x86_64')
url="https://phraseapp.com/cli"
license=('MIT')

source_i686=("phraseapp_linux_386-$pkgver.tar.gz::https://github.com/phrase/phraseapp-client/releases/download/$pkgver/phraseapp_linux_386.tar.gz")
source_x86_64=("phraseapp_linux_amd64-$pkgver.tar.gz::https://github.com/phrase/phraseapp-client/releases/download/$pkgver/phraseapp_linux_amd64.tar.gz")

sha256sums_i686=('4010adad757915052cf1c181d52238de4d459139a8a1611e3f2375d4e1e5972e')
sha256sums_x86_64=('795df6d4a8454b36e6761690ff98b19448b91e15164eb8dcbeae0d8cf292c64e')


package() {
  if [ $CARCH == 'i686' ]; then
    install -Dm0755 "$srcdir/phraseapp_linux_386" "$pkgdir/usr/bin/phraseapp"
  else
    install -Dm0755 "$srcdir/phraseapp_linux_amd64" "$pkgdir/usr/bin/phraseapp"
  fi
}
