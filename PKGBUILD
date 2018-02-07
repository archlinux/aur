# Maintainer : Matteo Rossillol--Laruelle <mbasiccomputing(at)gmail(dot)com>


_reponame=USB-Rubber-Ducky
pkgname=ducky-tools
pkgver=2.6.3
pkgrel=2
pkgdesc="Tools for USB Rubber Ducky by hak5darren"
arch=('i686' 'x86_64')
url="https://github.com/hak5darren/$_reponame"
license=('unknown')
depends=('java-runtime-common' 'dfu-programmer' 'python2' 'perl' 'bash')
provides=('duckencoder' 'ducky-encoder-gui' 'ducky-decode' 'ducky-flasher' 'duckflash' 'duckdump')
conflicts=('duck-encoder')
options=('!strip')
source=("$pkgname::https://github.com/hak5darren/$_reponame/archive/v$pkgver.tar.gz"
	"ducky-encoder-gui.desktop"
	"ducky-encoder-gui.png"
	"ducky")
sha256sums=('0e8cc19fa90718953a8c6221c75429bc3970fecb6f000fe0b722568b46e966f4'
            'eedcd70a5ef10ae7d0ae5b4a31e6912b2c15753d6fc817ab424afd5770cdc2f3'
            'cbd5dbec562c01bbac94ca9a6b956591babd8c8ab3c2b10f4db6d9aca2250ff9'
            'bdf984c1aa7951101d7d72109bebf6619b6462b0792f0ed45c3f42e8e6757be0')


package(){
    cd $srcdir
    install -m755 -D "ducky" "$pkgdir/usr/bin/ducky"
    install -m644 -D "ducky-encoder-gui.png" "$pkgdir/usr/share/icons/ducky-encoder-gui.png"
    install -m755 -D "ducky-encoder-gui.desktop" "$pkgdir/usr/share/applications/ducky-encoder-gui.desktop"
    install -d "$pkgdir/opt"
    cp -r "$_reponame-$pkgver" "$pkgdir/opt/$_reponame"
}
