# Maintainer : Beatussum <echo 'YmVhdHVzc3VtQHByb3Rvbm1haWwuY29tCg==' | base64 -d>


_reponame=USB-Rubber-Ducky
pkgname=ducky-tools
pkgver=2.6.3
pkgrel=3
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
            '36aba97ddc5e484b76e575af970459ecb2d82a412f8b2761cae64ae947301f27'
            'a722ebe52eaff600706e3d66d12c32324f2d57c402dff28d25e2974ff16dff57'
            '9a3817d59380d1e7f9c5690a1dfc1d740d59c34d8e185d52d081f60e46b726b5')


package(){
    cd $srcdir
    install -m755 -D "ducky" "$pkgdir/usr/bin/ducky"
    install -m644 -D "ducky-encoder-gui.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/ducky-encoder-gui.png"
    install -m755 -D "ducky-encoder-gui.desktop" "$pkgdir/usr/share/applications/ducky-encoder-gui.desktop"
    install -d "$pkgdir/opt"
    cp -r "$_reponame-$pkgver" "$pkgdir/opt/$_reponame"
}
