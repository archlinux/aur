# Maintainer: Marco Asa <marcoasa90[at]gmail[dot]com>
pkgname=linux-show-player
pkgver=0.3.1
pkgrel=2
pkgdesc="sound cue playback software designed for live musical shows and theatre plays"
url="http://linux-show-player.sourceforge.net/"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('python-pyqt5' 'python-gobject' 'gst-plugins-good' 
'python-setuptools')
optdepends=('portmidi: for portmidi support'
            'gst-libav: for larger format support')


source=(https://github.com/FrancescoCeruti/linux-show-player/archive/v0.3.1.tar.gz)


package() {
cd "$srcdir/$pkgname-0.3.1"
python setup.py install --root="$pkgdir/" --optimize=1
mkdir -p "$pkgdir/usr/share/applications"
mkdir -p "$pkgdir/usr/share/pixmaps"
mkdir -p "$pkgdir/usr/share/mime/packages"
cp dist/linux-show-player.desktop "$pkgdir/usr/share/applications/"
cp dist/linux_show_player.png "$pkgdir/usr/share/pixmaps/"
cp dist/linux-show-player.xml "$pkgdir/usr/share/mime/packages/"
}

md5sums=('a0683867d10da9c7f08967b86706ef02')
