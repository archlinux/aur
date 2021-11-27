# Maintainer: Frank Seifferth <frankseifferth@posteo.net>
pkgname=nscde
pkgver=1.4
pkgrel=1
pkgdesc='Modern and functional CDE desktop based on FVWM'
arch=('any')
url='https://github.com/NsCDE/NsCDE/'
depends=('ksh' 'xdotool' 'imagemagick' 'python-yaml' 'python-pyqt5'
    'qt5ct' 'qt5-styleplugins' 'stalonetray' 'xterm' 'python-psutil'
    'python-pyxdg' 'libstroke' 'xsettingsd' 'fvwm3' 'perl-file-mimeinfo'
    'gkrellm' 'rofi' 'xclip' 'xorg-server' 'xorg-xrefresh' 'xorg-xrdb'
    'xorg-xdpyinfo' 'dunst' 'xscreensaver')
license=('GPL3')
source=("https://github.com/NsCDE/NsCDE/archive/$pkgver.tar.gz")
md5sums=('05d972a6689fd22bfaff1cd7bb14e862')

build() {
    cd "$srcdir/NsCDE-$pkgver/src/XOverrideFontCursor/"
    make
}

package() {
    cd "$srcdir/NsCDE-$pkgver/"
    ./Installer.ksh -f -n -D "$pkgdir" -i
}
