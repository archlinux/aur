# Maintainer: Radu Birzu <radu@webative.net>
pkgname=andrei-desktop
pkgver=r164.80c7d3a
pkgrel=1
pkgdesc="An openbox based desktop environment focused on productivity and speed"
arch=('any')
url="https://gitlab.com/webative-open-source/andrei-linux"
license=('GPL3')
depends=('acl' 'acpi' 'acpid' 'adapta-gtk-theme' 'adapta-backgrounds' 'albert' 'alsa-utils' 'ananicy-git' 'arch-install-scripts' 'audacious' 'avahi' 'bleachbit' 'bluez' 'blueman' 'bluez-libs' 'bluez-utils' 'brightside' 'chromium' 'compton' 'conky' 'crda' 'cronie' 'cups' 'cups-filters' 'dkms' 'dnsmasq' 'dunst' 'evince' 'ffmpegthumbnailer' 'file-roller' 'filezilla' 'fortune-mod' 'freerdp' 'fuseiso' 'galculator' 'gconf-editor' 'git' 'gksu' 'gnome-icon-theme-extras' 'gnome-keyring' 'gnome-logs' 'gnome-screenshot' 'gnome-system-monitor' 'gparted' 'gpointing-device-settings' 'gptfdisk' 'grml-zsh-config' 'gufw' 'gvfs-mtp' 'gvfs-smb' 'haveged' 'htop' 'intel-ucode' 'inxi' 'iotop' 'leafpad' 'lib32-alsa-plugins' 'lib32-libpulse' 'libva-intel-driver' 'libva-mesa-driver' 'linux-zen' 'linux-zen-headers' 'lm_sensors' 'lshw' 'lsof' 'lxdm' 'lxdm-themes' 'lxappearance-obconf' 'lxinput' 'lxpolkit-git' 'lxrandr' 'meld' 'mhash' 'mlocate' 'mobile-broadband-provider-info' 'modemmanager' 'most' 'mplayer' 'networkmanager' 'network-manager-applet' 'networkmanager-openvpn' 'networkmanager-pptp' 'nmap' 'nmon' 'ntfs-3g' 'obconf' 'oblogout' 'obmenu' 'openbox' 'openssh' 'openvpn' 'osmo' 'p7zip' 'pamac-aur' 'paman' 'paper-icon-theme' 'paprefs' 'parcellite' 'pasystray' 'pavucontrol' 'pavumeter' 'pcmanfm' 'pepper-flash' 'perl' 'php' 'pkgfile' 'plank' 'plank-theme-arc' 'powertop' 'pulseaudio' 'pulseaudio-alsa' 'pulseaudio-ctl' 'python2-notify' 'python2-pyqt4' 'python2-xdg' 'redshift' 'rsync' 'sakura' 'samba' 'sane' 'screen' 'seahorse' 'simple-scan' 'skippy-xd-git' 'sshfs' 'systemd-ui' 'thunderbird' 'tint2' 'transmission-cli' 'transmission-qt' 'ttf-freefont' 'ttf-ms-fonts' 'ttf-roboto' 'unrar' 'unzip' 'usb_modeswitch' 'viewnior' 'vim' 'vim-colorsamplerpack' 'vim-ctrlp' 'vim-fugitive' 'vim-supertab' 'vim-systemd' 'vim-vcscommand' 'wget' 'whois' 'wol' 'x11vnc' 'xautolock' 'xclip' 'xdotool' 'xlockmore' 'xorg-server' 'xorg-xbacklight' 'xsel' 'zenity' 'zip' 'zsh' 'zsh-completions' 'zsh-syntax-highlighting')
optdepends=('acetoneiso2: An all in one ISO tool'
	          'aisleriot: A collection of patience games'
	          'gimp: GNU Image Manipulation Program'
	          'inkscape: Professional vector graphics editor'
	          'keepassx: Password manager'
	          'libreoffice-fresh: Free office suite'
	          'playonlinux: GUI for managing Windows programs under linux'
	          'remmina: remote desktop client written in GTK+'
	          'synergy: Share a single mouse and keyboard between multiple computers'
	          'vlc: Multi-platform MPEG, VCD/DVD, and DivX player'
	          'zim: A WYSIWYG text editor for a desktop wiki')
makedepends=('acl' 'git' 'rsync')
install="${pkgname}.install"
source=('git+https://gitlab.com/webative-open-source/andrei-linux.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/andrei-linux/"
	setfacl --restore=./permissions.acl 2>&1

	# copy scripts
	rsync -qacAX ./files/usr "$pkgdir/"
}
