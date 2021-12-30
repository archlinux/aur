# Maintainer: Frank Seifferth <frankseifferth@posteo.net>
pkgname=nscde
pkgver=2.0
pkgrel=1
pkgdesc='Not so Common Desktop Environment: Modern and functional CDE desktop based on FVWM'
arch=('x86_64')
url='https://github.com/NsCDE'
depends=('libxext' 'libx11' 'libxpm' 'stalonetray' 'xsettingsd' 'fvwm'
    'glibc' 'ksh' 'dunst' 'imagemagick' 'xorg-xprop' 'xorg-xrdb'
    'xorg-xset' 'xorg-xdpyinfo' 'xorg-xrefresh' 'xorg-xmodmap'
    'xorg-xrandr' 'gcc' 'xterm' 'python3' 'python-pyxdg' 'python-yaml'
    'python-psutil' 'python-qtpy' 'xdotool' 'xdg-utils' 'gettext')
makedepends=('xorgproto' 'autoconf' 'automake')
optdepends=('xclip: Copy screen, window of area shot to X11 clipboard'
    'xscreensaver: Enhanced X screensaver'
    'dex: Run desktop definitions from $HOME/.config/autostart'
    'gtk2: Pixmap engine for theme and Qt gtk engine is here'
    'qt5-styleplugins: integrate gtk2 NsCDE theme with Qt5'
    'qt5ct: Qt5 Configuration Utility'
    'gkrellm: System monitor package fits nicely with NsCDE')
license=('GPL3')
source=("https://github.com/NsCDE/NsCDE/archive/$pkgver.tar.gz")
md5sums=('05ccbe937dbbe20597d105f28e93e0ef')

build() {
    cd "$srcdir/NsCDE-$pkgver/"
    ./configure --prefix=/usr --libexecdir=/usr/lib
    make
}

package() {
    cd "$srcdir/NsCDE-$pkgver/"
    make DESTDIR="$pkgdir/" install
}
