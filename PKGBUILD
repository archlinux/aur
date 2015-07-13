# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>

pkgname=soundhelix
pkgver=0.8
pkgrel=1
pkgdesc="Tool for creating algorithmic random MIDI music"
arch=('i686' 'x86_64')
url="http://www.soundhelix.com/"
license=('GPL')
depends=('java-runtime')
source=("http://downloads.sourceforge.net/project/soundhelix/SoundHelix-"$pkgver"-bin.zip"
	"soundhelix"
	"SoundHelix-logo-medium.png"
	"soundhelix.desktop"
	)
md5sums=('7dbe5aee3fca7e2f36db5d37d48c0824'
         '790b82587ddf5c6aab42589fc410250c'
         'eb639d466cb81d1e4ab34fc425538c50'
         '688d5fce1d2304eb476bb6ee5ca591aa')

package() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/lib/soundhelix
  cp -pr * $pkgdir/usr/lib/soundhelix
  
  cd $srcdir
  install -Dm 755 soundhelix $pkgdir/usr/bin/soundhelix
  install -D SoundHelix-logo-medium.png $pkgdir/usr/share/icons/SoundHelix-logo-medium.png
  install -D soundhelix.desktop $pkgdir/usr/share/applications/soundhelix.desktop
}
