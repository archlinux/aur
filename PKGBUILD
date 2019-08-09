# Maintainer: Librewish <librewish@gmail.com>


pkgbase=manjarowish-lxqt-kwin-dark-settings
_gitname=manjarowish-lxqt-kwin-dark-settings
pkgname=(
    'manjarowish-lxqt-kwin-dark-settings'
    )
pkgver=0.1
pkgrel=1
arch=('any')
_branch='master'
url="https://github.com/librewish/manjarowish-lxqt-kwin-dark-settings"
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
    pkgdesc='Manjarowish Linux Lxqt-Kwin dark settings'
    depends=(
        'kvantum-qt5'
        'plank'
        'lxqt-about'
        'lxqt-admin'
        'lxqt-config'
        'lxqt-globalkeys'
        'lxqt-notificationd'
        'lxqt-openssh-askpass'
        'lxqt-panel'
        'lxqt-policykit'
        'lxqt-powermanagement'
        'lxqt-qtplugin'
        'lxqt-runner'
        'lxqt-session'
        'lxqt-sudo'
        'lxqt-themes'
        'pcmanfm-qt'
        'lximage-qt'
        'qterminal'
        'pavucontrol-qt'
        'lxqt-archiver-git'
        'qlipper'
        'mojave-gtk-theme-git'
        'papirus-icon-theme'
        'noto-fonts'
        'preload'
        'haveged'
        'irqbalance'
        'systemd-swap'
        'nohang-git'
        'sddm-kcm'
        'kwin'
        'kde-cli-tools'
        'kwin-decoration-sierra-breeze-enhanced-git'
        'kwin-effects-yet-another-magic-lamp'
        'kwin-scripts-forceblur'
        )
    optdepends=(
        'timeshift-autosnap'
        'grub-btrfs'
        )    
    install=manjarowish-lxqt-kwin-dark-settings.install
    conflicts=('manjarowish-light-settings-settings','manjaro-kde-settings','manjarowish-dark-settings-settings')
    replaces=('manjarowish-light-settings-settings','manjaro-kde-settings','manjarowish-dark-settings-settings')
    provides=('manjaro-desktop-settings')
    conflicts=('manjaro-desktop-settings')

    _install ''
}

