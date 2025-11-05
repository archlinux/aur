# Maintainer: Firstpick firstpick1992@proton.me
pkgname=pacsea-bin
pkgver=0.4.5
_tag="v$pkgver"
pkgrel=1
pkgdesc="Fast TUI for searching, inspecting, and queueing pacman/AUR packages written in Rust (binary version)"
arch=('x86_64')
url="https://github.com/Firstp1ck/Pacsea"
license=('MIT')
options=('!strip')
depends=('pacman' 'curl' 'bash' 'sudo' 'coreutils' 'grep' 'xdg-utils')
optdepends=(
    'paru: AUR package installation'
    'yay: alternative AUR helper'
    'wl-clipboard: clipboard support on Wayland'
    'xclip: clipboard support on X11'
    'reflector: update Arch mirrors'
    'pacman-mirrors: Manjaro mirrorlist'
    'alacritty: run external commands in a terminal'
    'kitty: run external commands in a terminal'
    'ghostty: run external commands in a terminal'
    'xterm: run external commands in a terminal'
    'gnome-terminal: run external commands in a terminal'
    'konsole: run external commands in a terminal'
    'xfce4-terminal: run external commands in a terminal'
    'tilix: run external commands in a terminal'
    'mate-terminal: run external commands in a terminal'
    'neovim: external editor'
    'vim: external editor'
    'emacs: external editor'
    'helix: external editor'
    'nano: external editor'
    'klipper: clipboard manager on X11'
    'clamav: malware scanning of files'
    'trivy: vulnerability scanning'
    'semgrep-bin: static analysis checks'
    'shellcheck: lint shell scripts'
    'downgrade: Downgrade of Packages'
)
provides=("pacsea=${pkgver}")
conflicts=('pacsea' 'pacsea-git')
source=("Pacsea::https://github.com/Firstp1ck/Pacsea/releases/download/${_tag}/Pacsea"
        "Pacsea-${_tag}.tar.gz::https://github.com/Firstp1ck/Pacsea/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('c86ba55b1fd6e8b06ed157efae2fefa5bd137ffe0c65a7408303b8b59ec0ff2f'
            'f6850f87819be55d3faaa8ff30a4b008a374a1d4e1cdef25782e61b16cadc944')

package() {
  : "${pkgdir:?pkgdir is not set}"
  : "${srcdir:?srcdir is not set}"

  # Install binary (release asset is named 'Pacsea'; install as lowercase 'pacsea')
  install -Dm755 "$srcdir/Pacsea" "$pkgdir/usr/bin/pacsea"

  # Install license and documentation from tagged source tarball
  install -Dm644 "$srcdir"/Pacsea-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir"/Pacsea-*/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
