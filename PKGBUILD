pkgbase=archlinux-studio-utils
pkgname=('archlinux-studio-utils-efistub' 'archlinux-studio-utils-pipewire')
pkgver=r4.bb6a39f
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

package_archlinux-studio-utils-efistub() {
    depends=('efibootmgr')

    ## Install Script
    install -Dm755 "$pkgbase/efistub/script/efistub-manager" "$pkgdir/usr/bin/efistub-manager"
    install -Dm755 "$pkgbase/efistub/script/xe-kernel-driver-toggle" "$pkgdir/usr/bin/xe-kernel-driver-toggle"

    ## Install Menu Entries
    install -Dm644 "$pkgbase/efistub/menu_entry/EFIStub Create.desktop" "$pkgdir/usr/share/applications/EFIStub Create.desktop"
    install -Dm644 "$pkgbase/efistub/menu_entry/EFIStub Delete.desktop" "$pkgdir/usr/share/applications/EFIStub Delete.desktop"
    install -Dm644 "$pkgbase/efistub/menu_entry/Intel XE Enable.desktop" "$pkgdir/usr/share/applications/Intel XE Enable.desktop"
    install -Dm644 "$pkgbase/efistub/menu_entry/Intel XE Disable.desktop" "$pkgdir/usr/share/applications/Intel XE Disable.desktop"
}

package_archlinux-studio-utils-pipewire() {
    depends=('pipewire' 'kdialog')

    ## Install Script
    install -Dm755 "$pkgbase/pipewire/script/pipewire_audio_toggle" "$pkgdir/usr/bin/pipewire_audio_toggle"

    ## Install Menu Entries
    install -Dm644 "$pkgbase/pipewire/menu_entry/Pipewire Audio Sesssion Toggle.desktop" "$pkgdir/usr/share/applications/Pipewire Audio Sesssion Toggle.desktop"
}
