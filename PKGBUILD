# This is the PKGBUILD for TMSU

# Maintainer: Tomáš Mládek <tmladek{at}inventati{dt}org> 

pkgname=tmsu
pkgver=0.5.2
pkgrel=1
pkgdesc="A tool for tagging your files and accessing them through a virtual filesystem."
arch=('i686' 'x86_64')
url="http://tmsu.org/"
depends=('go' 'fuse' 'sqlite>=3')
provides=('tmsu')
license=('GNU GPL v3')
source_i686=("https://github.com/oniony/TMSU/releases/download/v$pkgver/tmsu-i686-$pkgver.tgz")
source_x86_64=("https://github.com/oniony/TMSU/releases/download/v$pkgver/tmsu-x86_64-$pkgver.tgz")
sha256sums_i686=('e09ef8dab30f16cf1cec42610e575cc03362276da614bcf4f904decd79201466')
sha256sums_x86_64=('5e994bc3112beeb0fe2a692aae2b313b185b9628f63ad09654b2c61e813104cc')

package(){
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1" "$pkgdir/usr/share/zsh/site-functions"
  cd "$srcdir/$pkgname-$CARCH-$pkgver"

  cp "bin/"* "$pkgdir/usr/bin"
  cp "man/tmsu.1.gz" "$pkgdir/usr/share/man/man1"
  cp "misc/zsh/_tmsu" "$pkgdir/usr/share/zsh/site-functions"
}
