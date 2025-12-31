# Maintainer: Kevin F. Cantero <kevin.cantero@vortex.ar>
pkgname=bms-shell-bin
pkgver=1.0.3
pkgrel=3
pkgdesc='Desktop shell for wayland compositors built with Quickshell & GO'
arch=(x86_64 aarch64)
url='https://github.com/Heroblaze2310/bms-shell-bin'
license=(MIT)
depends=(dgop
         quickshell
         accountsservice)
optdepends=('cava: Audio visualizer'
            'cliphist: Clipboard history functionality'
            'i2c-tools: External monitor brightness control'
            'matugen: Dynamic wallpaper-based theming'
            'qt6-multimedia: Sound effect support'
            'power-profiles-daemon: Set power profile'
            'qt6ct: Qt6 application theming'
            'wl-clipboard: Copy functionality for PIDs and other elements')
provides=(bms-shell)
conflicts=(bms-shell-git bms-shell)

source_x86_64=(
  "completion.bash::https://raw.githubusercontent.com/Heroblaze2310/bms-shell-bin/main/completion.bash"
  "completion.fish::https://raw.githubusercontent.com/Heroblaze2310/bms-shell-bin/main/completion.fish"
  "completion.zsh::https://raw.githubusercontent.com/Heroblaze2310/bms-shell-bin/main/completion.zsh"
  "bms-bin::https://raw.githubusercontent.com/Heroblaze2310/bms-shell-bin/main/bakraDEinstall-amd64.gz"
  "bms-full-amd64.tar.gz::https://raw.githubusercontent.com/Heroblaze2310/bms-shell-bin/main/bms-full-amd64.tar.gz"
  "bms.service::https://raw.githubusercontent.com/Heroblaze2310/bms-shell-bin/main/bms.service"
  "bakraDElogo.svg::https://raw.githubusercontent.com/Heroblaze2310/bms-shell-bin/main/bakraDElogo.svg"
  "bms-open.desktop::https://raw.githubusercontent.com/Heroblaze2310/bms-shell-bin/main/bms-open.desktop"
)

source_aarch64=(
  "completion.bash::https://raw.githubusercontent.com/Heroblaze2310/bms-shell-bin/main/completion.bash"
  "completion.fish::https://raw.githubusercontent.com/Heroblaze2310/bms-shell-bin/main/completion.fish"
  "completion.zsh::https://raw.githubusercontent.com/Heroblaze2310/bms-shell-bin/main/completion.zsh"
  "bakraDEinstall-arm64.gz::https://raw.githubusercontent.com/Heroblaze2310/bms-shell-bin/main/bakraDEinstall-arm64.gz"
  "bms.service::https://raw.githubusercontent.com/Heroblaze2310/bms-shell-bin/main/bms.service"
  "bakraDElogo.svg::https://raw.githubusercontent.com/Heroblaze2310/bms-shell-bin/main/bakraDElogo.svg"
  "bms-open.desktop::https://raw.githubusercontent.com/Heroblaze2310/bms-shell-bin/main/bms-open.desktop"
)

sha256sums_x86_64=('SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP')
                    
sha256sums_aarch64=('SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP'
                    'SKIP')

package() {
    install -Dm0755 "$srcdir/bms-full-amd64/bin/bms" "$pkgdir/usr/bin/bms"
    install -dm0755 "$pkgdir/usr/share/quickshell"
    cp -r "$srcdir/bms-full-amd64/bms" "$pkgdir/usr/share/quickshell/"
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" "$srcdir/bms-full-amd64/bms/README.md"
    cp -r "$srcdir/bms-full-amd64/docs/"* "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm0644 "bms.service" "$pkgdir/usr/lib/systemd/user/bms.service"
    install -Dm0644 "completion.bash" "$pkgdir/usr/share/bash-completion/completion/bms"
    install -Dm0644 "completion.zsh" "$pkgdir/usr/share/zsh/site-functions/_bms"
    install -Dm0644 "completion.fish" "$pkgdir/usr/share/fish/vendor_completion.d/bms.fish"
    install -Dm0644 "bms-open.desktop" "$pkgdir/usr/share/applications/bms-open.desktop"
    install -Dm0644 "bakraDElogo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/bakraDElogo.svg"
}
