# Maintainer: Stephan Raabe <mail@ml4w.com>
pkgname='ml4w-hyprland-git'
pkgver=2.9.6.r25.gaa6f4e3
pkgrel=1
pkgdesc="The ML4W Dotfiles for Hyprland - An advanced and full-featured configuration for the dynamic tiling window manager Hyprland including an easy to use installation script for Arch based Linux distributions. "
arch=(any)
url="https://github.com/mylinuxforwork/dotfiles"
license=('GPL')
options=(!strip)
depends=(
    # System
    "rsync"
    "htop"
    "pacman-contrib"
    "sed"
    "vim"
    "neovim"
    "bluez"
    "bluez-utils"
    "wget"
    "unzip"
    "alacritty" 
    "dunst" 
    "starship"
    "figlet" 
    "vlc" 
    "eza" 
    "brightnessctl"
    "gum"
    "man-pages"
    "python-pip" 
    "python-pywal"
    "python-gobject"
    "xarchiver"
    "zip"
    "fuse2"
    "gtk4"
    "libadwaita"
    "xdg-desktop-portal"
    "imagemagick"
    "guvcview"
    "jq"
    "pavucontrol" 
    "polkit-gnome"
    "gvfs"
    "xdg-user-dirs"
    "xclip"
    "trizen"
    "oh-my-posh"
    "aylurs-gtk-shell"
    # Apps
    "wlogout"
    "nwg-look"
    "waypaper"
    "rofi-wayland"
    "fastfetch"
    "blueman"
    "pinta"
    "cliphist"
    "pacseek"
    "nautilus"
    "gnome-text-editor"
    # Fonts
    "noto-fonts" 
    "otf-font-awesome" 
    "ttf-fira-sans" 
    "ttf-fira-code" 
    "ttf-firacode-nerd" 
    # Themes
    "papirus-icon-theme"
    "bibata-cursor-theme" 
    # Hyprland
    "hyprland"
    "hyprpaper"
    "hyprlock"
    "hypridle"
    "hyprshade"
    "xdg-desktop-portal-hyprland" 
    # Network
    "nm-connection-editor"
    "networkmanager"
    "network-manager-applet"
    "qt6ct"
    "stow"
    "zsh"
    "fzf"
    "zsh-completions"
    "waybar" 
    # Screenshot
    "grim" 
    "slurp"
    "grimblast"
)

optdepends=(
    "firefox: Browser"
    "flatpak: Flatpak support"
    "gnome-calculator: Calculator"
    "smile: Emoji Selector"
    "breeze: Breeze Theme"
    "breeze-icons: Breeze Icons"
    "mpv: Media Player" 
    "mission-center: System Monitor"
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
