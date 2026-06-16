# Maintainer: Brett Labbee <darkstardevx@gmail.com>
pkgname=hypr-audio-hud
pkgver=1.0.0
pkgrel=1
pkgdesc="Interactive, cyberpunk terminal audio recording HUD for Hyprland 0.55+ utilizing Ghostty, PipeWire, and CAVA"
arch=('any')
url="https://github.com/darkstardevx/hypr-audio-hud.git"
license=('MIT')
depends=('ghostty' 'cava' 'fzf' 'pipewire-utils' 'wireplumber' 'ncurses')
source=('audio_record_hud.sh' 'hyprland-hud-rules.lua')
sha256sums=('SKIP' 'SKIP') # Automatically calculated during the build phase

package() {
    # 1. Install the core interactive bash script directly into the user's system PATH
    install -Dm755 "${srcdir}/audio_record_hud.sh" "${pkgdir}/usr/bin/hypr-audio-hud"

    # 2. Deploy the template Hyprland rules snippet into user share for easy system integration
    install -Dm644 "${srcdir}/hyprland-hud-rules.lua" "${pkgdir}/usr/share/hypr-audio-hud/hyprland-hud-rules.lua"
}
