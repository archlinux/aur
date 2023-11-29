# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgbase='plasma-meta'
pkgname=plasma-essential-meta
pkgver=5.27
pkgrel=3.8
pkgdesc='Meta-PKG to install essential (and optional) KDE Plasma packages'
arch=(any)
license=(None)
url='https://community.kde.org/Distributions/Packaging_Recommendations'
provides=("${_pkgbase}=${pkgver}")
conflicts=(
  "${_pkgbase}"
  'dunst'                     # will take over Plasma notifications
  'ibus<1.5.29-1'             # Actually 'ibus-daemon' 1.5.28 and earlier is the problematic component, not ibus-data.
                              # It ignores keyboard layout configuration from System Settings and displays an out-of-sync extra layout indicator.
                              # On X11, uninstalling IBus breaks keyboard input in apps until session restart. 
                              # On Wayland, IBus 1.5.28 and earlier displays a notification about incompatibility with Plasma Wayland.
                              # These issues are resolved with IBus 1.5.29 and it is fine to use it with Plasma.
  'mako'                      # will take over Plasma notifications
  'qt5ct'                     # conflicts with plasma-integration, breaks Qt app themes
  'xdg-desktop-portal-gnome'  # conflicts with xdg-desktop-portal-kde
  'xf86-input-synaptics'      # provides subpar experience with touchpads
)

package() {
  depends=(
         kde-gtk-config
         kdeplasma-addons
         kscreen
         ksshaskpass
         plasma-browser-integration-extension
         plasma-desktop
         plasma-firewall
         plasma-systemmonitor
         kwallet-pam
         kgamma5
         sddm-kcm
         breeze-gtk
         powerdevil
         xdg-desktop-portal-kde
  )
  optdepends=(
            'bluedevil: Bluetooth management & desktop integration'
            'breeze-grub: Breeze theme for GRUB'
            'breeze-plymouth: Breeze theme for Plymouth'
            'discover: Manage installed applications and plugins (package manager)'
            'dolphin-plugins: Dolphin file manager with all extra plugins'
            'drkonqi: KDE crash reporting tool - only useful if debug symbol packages are installed'
            'emoji-font: (Color) emoji support'
            'ffmpegthumbs: Thumbnails for videos'
            'flatpak-kcm: Manage Flatpak applications from systemsettings'
            'iio-sensor-proxy: Auto screen rotation on Wayland'
            'kcm-wacomtablet: Manage Wacom devices from systemsettings'
            'kde-inotify-survey: Warn when inotify limits are too low; offers help in raising it)'
            'kdeconnect: Smartphone desktop integration and communication'
            'kdegraphics-thumbnailers: Thumbnails for PDF, Mobipocket and camera RAW image files'
            'kdenetwork-filesharing: Samba LAN file sharing setup'
            'khotkeys: Deprecated hotkeys management (only needed if user has legacy bindings defined in this)'
            'kinfocenter: System information application'
            'kio-admin: Manage files as administrator using the admin:// KIO protocol'
            'kio-fuse: Mount remote filesystems and access them in KDE and non-KDE apps'
            'kio-gdrive: Virtual filesystem access to Google Drive'
            "kwrited: Local System Message Service daemon for multiuser installations (listens for 'wall' and 'write' messages)"
            'libappindicator-gtk3: (Instead of the GTK2 variant) for crisp status notifier systray icons'
            'maliit-keyboard: Virtual keyboard for Wayland'
            'orca: Screen reader for visually impaired users'
            'oxygen-sounds: Default KDE sound theme'
            'oxygen: KDE Oxygen style (legacy)'
            'phonon-vlc: Recommended Phonon backend, as the GStreamer variant is very old and unmaintained'
            'plasma-disks: Monitors S.M.A.R.T. capable drives for imminent failure'
            'plasma-nm: NetworkManager connection configuration & desktop integration'
            'plasma-pa: PulseAudio volume management applet'
            'plasma-sdk: Development tools'
            'plasma-thunderbolt: Manage Thunderbolt-connected devices from systemsettings'
            'plasma-vault: Create and manage encrypted vaults (folders)'
            'plasma-wayland-session: Run Plasma on Wayland'
            'plasma-welcome: First use introducton and setup helper'
            'plasma-workspace-wallpapers: Default wallpapers'
            'plymouth-kcm: Configure Plymouth from systemsettings'
            'print-manager: Manage printers from systemsettings'
            'switcheroo-control: Hybrid/multi-GPU detection'
            'xdg-desktop-portal-gtk: Flatpak app font settings integration'
            'xsettingsd: GTK/X11 HiDPI scaling; Flatpak GTK integration; GTK theme change without restart'
            'xwaylandvideobridge: Let XWayland-based screensharing apps record and share Wayland-based windows'
  )
}
