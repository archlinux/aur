# By MBC (Matteo's Basic Computing)
# Maintainer : Matteo Rossillol <mbasiccomputing(at)gmail(dot)com>


_reponame=USB-Rubber-Ducky
pkgname=duck-encoder
pkgver=2.6.3    
pkgrel=1
arch=('x86_64')
depends=('jre8-openjdk')
provides=('duckencoder' 'ducky-encoder-gui')
options=('!strip')
license=('unknown')
url="https://github.com/hak5darren/$_reponame"
pkgdesc="The USB Rubber Ducky is a Human Interface Device programmable with a simple scripting language allowing penetration testers to quickly and easily craft and deploy security auditing payloads that mimic human keyboard input"
source=("https://github.com/hak5darren/$_reponame/archive/v$pkgver.tar.gz"
	"ducky-encoder-gui.desktop"
	"ducky-encoder.png"
	"duckencoder")
sha256sums=('0e8cc19fa90718953a8c6221c75429bc3970fecb6f000fe0b722568b46e966f4'
            '85fdb9f7fd6b7448710226e67b24d595d4d4b68c76cc5c9cb5f73820733cc452'
            'cbd5dbec562c01bbac94ca9a6b956591babd8c8ab3c2b10f4db6d9aca2250ff9'
            '920729c0b665d9b18e80b3e11a079890b4fbd60e9c378ed40a899289e2b90328')

package()
{
	install -d "$pkgdir/opt"
	install -d "$pkgdir/usr/bin"
	cp -r "$srcdir/$_reponame-$pkgver" "$pkgdir/opt/$_reponame"
	install -m755 $srcdir/duckencoder  $pkgdir/usr/bin/
	install -d "$pkgdir/usr/share/applications"
	install -d "$pkgdir/usr/share/icons"
	install -m755 "$srcdir/ducky-encoder-gui.desktop" "$pkgdir/usr/share/applications"
	install -m644 "$srcdir/ducky-encoder.png" "$pkgdir/usr/share/icons"
}
