pkgbase=archlinux-studio-utils
pkgname=('archlinux-studio-utils-cpufreq-scaling' 'archlinux-studio-utils-efistub' 'archlinux-studio-utils-pipewire')
pkgver=r16.1ba26a0
pkgrel=1
arch=('x86_64')
url="https://github.com/usrmusicman/ArchLinuxStudioUtils"
license=('EULA')
makedepends=('git')
source=("$pkgbase"::"git+https://github.com/usrmusicman/ArchLinuxStudioUtils")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package_archlinux-studio-utils-cpufreq-scaling() {
    pkgdesc="CPU frequency scaling selection script"

    ## Install Script
    install -Dm755 "$pkgbase/cpufreq/script/cpufreq_governor_selector" "$pkgdir/usr/bin/cpufreq_governor_selector"

    ## Install Menu Entries
    install -Dm644 "$pkgbase/cpufreq/menu_entry/CPUFreq Selector.desktop" "$pkgdir/usr/share/applications/CPUFreq Selector.desktop"
}

package_archlinux-studio-utils-efistub() {
    depends=('efibootmgr')
    replaces=('archlinux-studio-utils-efistub-intel-toggle')
    conflicts=('archlinux-studio-utils-efistub-intel-toggle')
    pkgdesc="EFI boot entry creation and removal tool"

    ## Install Script
    install -Dm755 "$pkgbase/efistub/script/efistub-manager" "$pkgdir/usr/bin/efistub-manager"

    ## Install Menu Entries
    install -Dm644 "$pkgbase/efistub/menu_entry/EFI Stub Manager.desktop" "$pkgdir/usr/share/applications/EFI Stub Manager.desktop"
}

package_archlinux-studio-utils-pipewire() {
    depends=('pipewire' 'kdialog')
    pkgdesc="GUI pipewire session toggle tool"

    ## Install Script
    install -Dm755 "$pkgbase/pipewire/script/pipewire_audio_toggle" "$pkgdir/usr/bin/pipewire_audio_toggle"

    ## Install Menu Entries
    install -Dm644 "$pkgbase/pipewire/menu_entry/Pipewire Audio Sesssion Toggle.desktop" "$pkgdir/usr/share/applications/Pipewire Audio Sesssion Toggle.desktop"
}
