# Maintainer: sixpindin <sixpindin@gmail.com>
pkgname=omnisharp-roslyn
pkgver=1.23.0
pkgrel=1
pkgdesc=".NET development platform based on on Roslyn workspaces."
arch=('x86_64')
url="https://github.com/OmniSharp/omnisharp-roslyn"
license=('MIT')
depends=('mono')
noextract=('$pkgname-$pkgver.tar.gz')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v$pkgver/omnisharp-mono.tar.gz"
	"LICENSE::https://raw.githubusercontent.com/OmniSharp/omnisharp-roslyn/master/license.md")

package() {

#binaries
	  mkdir -p $pkgdir/opt/$pkgname
	  tar -xf $srcdir/$pkgname-$pkgver.tar.gz -C $pkgdir/opt/$pkgname

	  #setup permissions
	  chown -R root:root $pkgdir/opt/$pkgname
	  find $pkgdir/opt -type f | xargs chmod 644
	  find $pkgdir/opt -type d | xargs chmod 755
	  chmod 755 $pkgdir/opt/$pkgname/OmniSharp.exe

#license
	  install -D -m644 $srcdir/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
md5sums=('0cf6d3ea9f3b231a9eaa5aedff859a4f'
         '19a620e118d664537fb9dac578810f8d')
