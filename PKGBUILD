# Maintainer: Librewish <librewish@gmail.com>


pkgbase=manjarowish-dark-kde-settings
_gitname=manjarowish-dark
pkgname=(
    'manjarowish-dark-kde-settings'
    )
pkgver=0.1
pkgrel=5
arch=('any')
_branch='master'
url="https://github.com/librewish/manjarowish-dark"
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

package_manjarowish-dark-kde-settings() {
    pkgdesc='Manjarowish Linux kde dark settings'
    depends=(
        'kvantum-qt5'
        'latte-dock'
        'mojave-gtk-theme-git'
        'papirus-icon-theme'
        'noto-fonts'
        'preload'
        'haveged'
        'irqbalance'
        'systemd-swap'
        'plasma5-applets-active-window-control'
        'plasma5-applets-eventcalendar'
        'plasma5-applets-netspeed'
        'plasma5-applets-plasma-pstate'
        'plasma5-applets-redshift-control'
        'kwin-decoration-sierra-breeze-enhanced-git'
        'kwin-effects-yet-another-magic-lamp'
        )
    optdepends=(
        'timeshift-autosnap'
        'grub-btrfs'
        )    
    install=manjarowish-dark-kde-settings.install
    conflicts=('manjarowish-light-settings-settings','manjaro-kde-settings')
    replaces=('manjarowish-light-settings-settings','manjaro-kde-settings')
    provides=('manjaro-desktop-settings')
    conflicts=('manjaro-desktop-settings')

    _install ''
}

