# Working example of Arch Linux PKGBUILD for NsCDE 2.X - Chinese Localization
pkgname=nscde-zh
pkgver=2.3.2
pkgrel=1
pkgdesc="Not so Common Desktop Environment: Modern and functional CDE based on FVWM - Chinese Localization"
arch=(x86_64)
url="https://github.com/wenyinos/NsCDE-zh"
license=('GPL')
depends=('libxext' 'libx11' 'libxpm' 'stalonetray' 'xsettingsd' 'fvwm3' 'glibc' 'ksh'
'imagemagick' 'xorg-xprop' 'xorg-xrdb' 'xorg-xset' 'xorg-xdpyinfo' 'xorg-xrefresh'
'xorg-xmodmap' 'xorg-xrandr' 'gcc' 'xterm' 'python3' 'python-pyxdg' 'python-yaml'
'python-psutil' 'python-qtpy' 'xdotool' 'xdg-utils' 'gettext' 'groff' 'ttf-dejavu' 'noto-fonts-cjk'
'qterminal' 'pcmanfm-qt' 'gvim' 'pavucontrol-qt' 'arandr' 'kcalc')
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
provides=('nscde-zh')
source=($pkgname-$pkgver.tar.gz::https://github.com/wenyinos/NsCDE-zh/archive/refs/tags/v${pkgver}_zh.tar.gz)
md5sums=('SKIP')

build() {
  cd "NsCDE-zh-${pkgver}_zh"

  ./configure --prefix=/usr --libexecdir=/usr/lib
  make
}

package() {
  cd "NsCDE-zh-${pkgver}_zh"

  make DESTDIR="$pkgdir/" install
}
