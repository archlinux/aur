# Working example of Arch Linux PKGBUILD for NsCDE 2.X
pkgname=nscde-zh
pkgver=2.4.3.4
pkgrel=1
pkgdesc="Not so Common Desktop Environment: Modern and functional CDE based on FVWM"
arch=('x86_64' 'aarch64')
url="https://github.com/WenYin-Community/NsCDE"
license=('GPL')
depends=('libxext' 'libx11' 'libxpm' 'stalonetray' 'xsettingsd' 'fvwm3' 'glibc' 'ksh'
'imagemagick' 'xorg-xprop' 'xorg-xrdb' 'xorg-xset' 'xorg-xdpyinfo' 'xorg-xrefresh'
'xorg-xmodmap' 'xorg-xrandr' 'gcc' 'xterm' 'python3' 'python-pyxdg' 'python-yaml'
'python-psutil' 'xdotool' 'xdg-utils' 'gettext' 'groff' 'ttf-dejavu' 'wqy-bitmapfont')
makedepends=('xorgproto' 'autoconf' 'automake')
optdepends=('xclip: Copy screen, window of area shot to X11 clipboard'
'xscreensaver: Enhanced X screensaver'
'dunst: Standalone Notification Daemon'
'dex: Run desktop definitions from $HOME/.config/autostart'
'gtk2: Pixmap engine for theme and Qt gtk engine is here'
'qt5-styleplugins: integrate gtk2 NsCDE theme with Qt5'
'qt5ct: Qt5 Configuration Utility'
'qt6ct: Qt6 Configuration Utility'
'picom: X compositor that may fix tearing issues'
'gkrellm: System monitor package fits nicely with NsCDE')
# options=()
provides=('nscde')
source=("nscde-zh-$pkgver::git+https://github.com/WenYin-Community/NsCDE.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr --libexecdir=/usr/lib
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

