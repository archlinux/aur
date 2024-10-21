pkgname=archlinux-studio-utils
pkgver=r34.d1710d2
pkgrel=1
arch=('x86_64')
url="https://github.com/usrmusicman/ArchLinuxStudioUtils"
license=('EULA')
depends=('cpupower' 'pipewire' 'pipewire-jack')
optdepnds=('ardour: Professional-grade digital audio workstation'
          'carla: Audio Plugin Host'
          'kdialog: A utility for displaying dialog boxes from shell scripts'
          'qtractor: Audio/MIDI multitrack sequencer'
          'reaper: A complete digital audio production application for computers'
          'zenity: Display graphical dialog boxes from shell scripts')
provides=('archlinux-studio-utils-cpufreq-scaling' 'archlinux-studio-utils-pipewire')
conflicts=('archlinux-studio-utils-cpufreq-scaling' 'archlinux-studio-utils-pipewire')
makedepends=('git')
pkgdesc="Pipewire and AV application control"
source=("$pkgname"::"git+https://github.com/usrmusicman/ArchLinuxStudioUtils")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    ## Install Script
    install -Dm755 "$pkgbase/pipewire/script/pipewire_control_center" "$pkgdir/usr/bin/pipewire_control_center"

    ## Install Menu Entries
    install -Dm644 "$pkgbase/pipewire/menu_entry/Pipewire Control Center.desktop" "$pkgdir/usr/share/applications/Pipewire Control Center.desktop"
}
