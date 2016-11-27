pkgname=kontalk
pkgver=3.1.2
pkgrel=2
pkgdesc="Kontalk official platform independent desktop client"
arch=('x86_64')
url="https://kontalk.org/"
license=('GPL')
depends=('bash' 'java-environment>=8')
source=("https://github.com/kontalk/desktopclient-java/releases/download/v$pkgver/KontalkDesktop-$pkgver.zip"
        "$pkgname.sh"
        "$pkgname.desktop"
        "$pkgname.png")
sha1sums=('2da6dfa9ef60e4febbc4fda2d8d79fc938c295be'
          '128e7bde45a0dabd855fb230471ddb7df06be0bc'
          '4f0247ea3d67adec34b5fc2d0874a5ad8850d24d'
          'c39232bd242afc4fd5ceebe3d5633082ea8c97dc')
 
 
package() {
  cd "$srcdir"
 
  install -d "$pkgdir"/usr/share/$pkgname
  cp -dr KontalkDesktop-$pkgver/* "$pkgdir"/usr/share/$pkgname
  install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
