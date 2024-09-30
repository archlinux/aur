pkgbase=archlinux-studio-utils
pkgname=('archlinux-studio-utils-cpufreq-scaling' 'archlinux-studio-utils-pipewire')
pkgver=r25.26be4ee
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

package_archlinux-studio-utils-pipewire() {
    depends=('pipewire' 'kdialog')
    pkgdesc="GUI pipewire session toggle tool"

    ## Install Script
    install -Dm755 "$pkgbase/pipewire/script/pipewire_audio_toggle" "$pkgdir/usr/bin/pipewire_audio_toggle"

    ## Install Menu Entries
    install -Dm644 "$pkgbase/pipewire/menu_entry/Pipewire Audio Sesssion Toggle.desktop" "$pkgdir/usr/share/applications/Pipewire Audio Sesssion Toggle.desktop"
}
