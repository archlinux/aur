# Maintainer: justbrowsing <developer4linux+aur@gmail.com>
pkgname=jb-config
pkgver=1.7
pkgrel=3
pkgdesc="A gtkdialog GUI and backend to manage settings for JustBrowsing that allows loading/saving from a config file"
arch=('any')
url="https://github.com/justbrowsing/jb-config"
license=('GPL3')
depends=('gtkdialog-svn' 'systemd' 'diffutils' 'xorg-xrandr')
optdepends=('justbrowsing-systemd: Sets defaults on boot and save/load daemon'
            'cups: Needed for printing support'
            'xorg-xbacklight: Dim laptop backlight'
            'xcalib: Dim desktop monitor' 
            'xf86-input-synaptics: Touchpad settings'
            'pamixer: Volume settings'
            'justbrowsing-adeskbar: Panel with systray that is reloaded' 
            'jbxkb: Switch between keymaps'
            'network-manager-applet-gtk2: Connect to wired/wireless networks' 
            'pnmixer: Adjust volume' 
            'nitrogen: Update background/wallpaper'
            'justbrowsing-webapps: Compose e-mail redirect'
            'virtualbox-guest-utils: VirtualBox guest addons')
groups=("justbrowsing")
source=("https://github.com/justbrowsing/${pkgname}/archive/master.zip")
install="jbconfig.install"
md5sums=('e69c7f0c6130dfaa90c0fef0d70b06c6')
 
package() {
  cd "$srcdir/${pkgname}-master"
  mkdir -p "$pkgdir/usr/local/sbin" "$pkgdir/usr/bin" "$pkgdir/usr/share/jb-config"

  # Browser Wrappers
  install -Dm555 firefox "$pkgdir/usr/local/sbin/firefox"
  install -Dm555 google-chrome "$pkgdir/usr/local/sbin/google-chrome"
  install -Dm555 x-www-browser "$pkgdir/usr/bin/x-www-browser"
  install -Dm555 launch-webapp "$pkgdir/usr/bin/launch-webapp"

  # Common files
  install -Dm444 localstore_fullscreen.rdf "$pkgdir/usr/share/jb-config/localstore_fullscreen.rdf"
  install -Dm444 localstore_normal.rdf "$pkgdir/usr/share/jb-config/localstore_normal.rdf"

  # GUI Executables
  install -Dm555 jb-config "$pkgdir/usr/bin/jb-config"
  install -Dm555 savejb-config "$pkgdir/usr/bin/savejb-config"
  install -Dm555 loadjb-config "$pkgdir/usr/bin/loadjb-config"
  install -Dm555 loadjb-help "$pkgdir/usr/bin/loadjb-help"
  install -Dm555 loadjb-panel "$pkgdir/usr/bin/loadjb-panel"
  install -Dm555 loadjb-systray "$pkgdir/usr/bin/loadjb-systray"
  install -Dm555 loadjb-toggle "$pkgdir/usr/bin/loadjb-toggle"

  # Back-end Executables
  install -Dm555 rdp-cursors "$pkgdir/usr/bin/rdp-cursors"
  install -Dm555 setjb-backlight "$pkgdir/usr/bin/setjb-backlight"
  install -Dm555 setjb-clean "$pkgdir/usr/bin/setjb-clean"
  install -Dm555 setjb-default "$pkgdir/usr/bin/setjb-default"
  install -Dm555 setjb-display "$pkgdir/usr/bin/setjb-display"
  install -Dm555 setjb-email "$pkgdir/usr/bin/setjb-email"
  install -Dm555 setjb-gpu "$pkgdir/usr/bin/setjb-gpu"
  install -Dm555 setjb-idle "$pkgdir/usr/bin/setjb-idle"
  install -Dm555 setjb-keymap "$pkgdir/usr/bin/setjb-keymap"
  install -Dm555 setjb-kiosk "$pkgdir/usr/bin/setjb-kiosk"
  install -Dm555 setjb-locale "$pkgdir/usr/bin/setjb-locale"
  install -Dm555 setjb-mouse "$pkgdir/usr/bin/setjb-mouse"
  install -Dm555 setjb-networks "$pkgdir/usr/bin/setjb-networks"
  install -Dm555 setjb-printers "$pkgdir/usr/bin/setjb-printers"
  install -Dm555 setjb-url "$pkgdir/usr/bin/setjb-url"
  install -Dm555 setjb-volume "$pkgdir/usr/bin/setjb-volume"
  install -Dm555 setjb-zone "$pkgdir/usr/bin/setjb-zone"

  # Desktop launcher
  install -Dm644 "jbconfig.png" "$pkgdir/usr/share/pixmaps/jbconfig.png"
  install -Dm644 "jbconfig.desktop" "$pkgdir/usr/share/applications/jbconfig.desktop"
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/jb-config/LICENSE
}
