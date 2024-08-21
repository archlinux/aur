# Maintainer: Stephan Raabe <mail@ml4w.com>
pkgname='ml4w-hyprland-git'
pkgver=2.9.5.r46.g628e092
pkgrel=1
pkgdesc="The ML4W Dotfiles for Hyprland - An advanced and full-featured configuration for the dynamic tiling window manager Hyprland including an easy to use installation script for Arch based Linux distributions. "
arch=(any)
url="https://github.com/mylinuxforwork/dotfiles"
license=('GPL')
depends=(
    "pacman-contrib"
    "sed"
    "vim"
    "bluez"
    "bluez-utils"
    "neovim"
    "wget"
    "unzip"
    "alacritty" 
    "dunst" 
    "starship"
    "mpv" 
    "nautilus" 
    "mousepad"
    "noto-fonts" 
    "otf-font-awesome" 
    "ttf-fira-sans" 
    "ttf-fira-code" 
    "ttf-firacode-nerd" 
    "figlet" 
    "vlc" 
    "eza" 
    "python-pip" 
    "python-psutil" 
    "python-rich" 
    "python-click" 
    "python-pywal"
    "python-gobject"
    "pavucontrol" 
    "tumbler" 
    "papirus-icon-theme"
    "breeze-icons"
    "polkit-gnome"
    "brightnessctl"
    "gum"
    "man-pages"
    "nm-connection-editor"
    "gvfs"
    "xdg-user-dirs"
    "networkmanager"
    "network-manager-applet"
    "xarchiver"
    "zip"
    "fuse2"
    "gtk4"
    "libadwaita"
    "xdg-desktop-portal"
    "gnome-calculator"
    "imagemagick"
    "guvcview"
    "jq"
    "rofi-wayland"
    "fastfetch"
    "blueman"
    "xclip"
    "pinta"
    "breeze"
    "qt6ct"
    "stow"
    "firefox"
    "zsh"
    "fzf"
    "zsh-completions"
    "hyprland"
    "hyprpaper"
    "hyprlock"
    "hypridle"
    "xdg-desktop-portal-hyprland" 
    "waybar" 
    "grim" 
    "slurp"
    "cliphist"
    "bibata-cursor-theme" 
    "trizen"
    "pacseek"
    "smile"
    "oh-my-posh"
    "wlogout"
    "nwg-look"
    "hyprshade"
    "waypaper"
    "mission-center"
    "grimblast"
    "bun-bin"
    "aylurs-gtk-shell"
)
conflicts=('ml4w-hyprland')
makedepends=(git)
source=("${pkgname}::git+https://github.com/mylinuxforwork/dotfiles.git")
md5sums=('SKIP')

pkgver() {

    #version
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

package() {

    # share
	install -dm 755 ${pkgdir}/usr/share/ml4w-hyprland
	cp -r ${srcdir}/${pkgname}/share/. ${pkgdir}/usr/share/ml4w-hyprland

    # lib
	install -dm 755 ${pkgdir}/usr/lib/ml4w-hyprland
	cp -r ${srcdir}/${pkgname}/lib/. ${pkgdir}/usr/lib/ml4w-hyprland

    # bin
    install -Dm 755 ${srcdir}/${pkgname}/bin/ml4w-hyprland-setup ${pkgdir}/usr/bin/ml4w-hyprland-setup

    # license
    install -Dm 755 ${srcdir}/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    # doc
    install -Dm 755 ${srcdir}/${pkgname}/README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md

}

