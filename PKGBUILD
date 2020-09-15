# Maintainer: Cydrick Nonog <cydrick.dev@gmail.com>

pkgname=open-de
pkgdesc="Open Desktop Environment"
pkgver=1.1.0
pkgrel=1
arch=('x86_64')
licence=('custom')
source=("dotfiles.tar.gz::https://github.com/cydrickn/dotfiles/archive/v${pkgver}.tar.gz")
noextract=('dotfiles.tar.gz')
md5sums=('d8c133352ca225ae7c90340b83ecf83b')
depends=(
    'openbox'
    'obconf'
    'tint2'
    'rofi'
    'dunst'
    'vim'
    'rxvt-unicode'
    'imagemagick'
    'slop'
    'ffmpeg'
    'hsetroot'
    'xclip'
    'xsel'
    'xsettingsd'
    'xorg-xbacklight'
    'python-pyxdg'
    'firefox'
    'networkmanager'
    'network-manager-applet'
)
makedepends=(
    'autorandr'
)
optdepends=('neofetch' 'code' 'libreoffice-still' 'bluez' 'blueman')
provides=('open-de')

package() {
 bsdtar -xf dotfiles.tar.gz
 rm dotfiles-${pkgver}/PREVIEW.png dotfiles-${pkgver}/README.md dotfiles-${pkgver}/.gitignore
 mkdir $pkgdir/etc/
 mv dotfiles-${pkgver} $pkgdir/etc/skel
}
