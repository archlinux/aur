# Maintainer: Librewish <librewish@gmail.com>


pkgbase=manjarowish-pantheon-settings
_gitname=manjarowish-pantheon-settings
pkgname=(
    'manjarowish-pantheon-settings'
    )
pkgver=0.1
pkgrel=6
arch=('any')
_branch='master'
url="https://github.com/librewish/manjarowish-pantheon-settings"
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

package_manjarowish-pantheon-settings() {
    pkgdesc='Manjarowish Linux pantheon settings'
    depends=(
        'kvantum-qt5'
        'preload'
        'haveged'
        'irqbalance'
        'systemd-swap'
        'nohang-git'
        'qt5ct'
        'elementary-icon-theme-git'
        'gtk-theme-elementary-git'
        'pantheon-session'
        'gala-git'
        'granite-git'
        'plank-git'
        'switchboard-git'
        'wingpanel-git'
        ttf-{droid,opensans,roboto}
       gnome-settings-daemon-{elementary,compat}
        )
    optdepends=(
        'timeshift-autosnap'
        'grub-btrfs'
        )    
    install=manjarowish-pantheon-settings.install
    replaces=('manjarowish-dark-settings-settings','manjaro-kde-settings','manjarowish-light-settings-settings')
    provides=('manjaro-desktop-settings')
    conflicts=(
    'manjaro-desktop-settings'
    'manjarowish-dark-settings-settings'
    'manjaro-kde-settings'
    'manjarowish-light-settings-settings'
    'pantheon-workaround'
    'pantheon-default-settings'
    )

    _install ''
}

