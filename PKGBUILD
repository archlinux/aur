# Maintainer: Librewish <librewish@gmail.com>


pkgbase=manjarowish-light-kde-settings
_gitname=manjarowish-light
pkgname=(
    'manjarowish-light-kde-settings'
    )
pkgver=0.1
pkgrel=8
arch=('any')
_branch='master'
url="https://github.com/librewish/manjarowish-light"
license=('GPL')
makedepends=('git')
source=("git+$url.git#branch=${_branch}")
sha256sums=('SKIP')

_install() {
    if [[ -d $srcdir/$_gitname/$1/etc ]]; then
        install -d $pkgdir/etc
        cp -rf $srcdir/$_gitname/$1/etc $pkgdir
    fi

    if [[ -d $srcdir/$_gitname/$1/usr ]]; then
        install -d $pkgdir/etc
        cp -rf $srcdir/$_gitname/$1/usr $pkgdir
    fi
    
    if [[ -d $srcdir/$_gitname/$1/skel ]]; then
        install -d $pkgdir/etc
        cp -rf $srcdir/$_gitname/$1/skel $pkgdir/etc
    fi

}

package_manjarowish-light-kde-settings() {
    pkgdesc='Manjarowish Linux kde light settings'
    depends=(
        'kvantum-qt5'
        'latte-dock'
        'flameshot'
        'kim4'
        'mojave-gtk-theme-git'
        'papirus-icon-theme'
        'noto-fonts'
        'preload'
        'haveged'
        'irqbalance'
        'systemd-swap'
        'nohang-git'
        'plasma5-applets-window-title'
        'plasma5-applets-window-appmenu'
        'plasma5-applets-window-buttons'
        'plasma5-applets-eventcalendar'
        'plasma5-applets-netspeed'
        'plasma5-applets-plasma-pstate'
        'plasma5-applets-redshift-control'
        'kwin-decoration-sierra-breeze-enhanced-git'
        'kwin-effects-yet-another-magic-lamp'
        'kwin-scripts-forceblur'
        'kwin-scripts-window-colors'
        )
    optdepends=(
        'timeshift-autosnap'
        'grub-btrfs'
        )    
    install=manjarowish-light-kde-settings.install
    conflicts=('manjarowish-dark-settings-settings','manjaro-kde-settings')
    replaces=('manjarowish-dark-settings-settings','manjaro-kde-settings')
    provides=('manjaro-desktop-settings')
    conflicts=('manjaro-desktop-settings')

    _install ''
}

