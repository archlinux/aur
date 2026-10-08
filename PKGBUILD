# Maintainer: Vladimir Alyamkin <ufna@ufna.dev>
pkgname=zerus-ade-nightly-bin
pkgver=0.37.0.r78.gfef1a00.n2
pkgrel=1
pkgdesc='Nightly agent development environment for persistent local and remote tmux sessions'
arch=('x86_64')
url='https://github.com/ufna/zerus'
license=('MIT')
# Floors describe the tested binary, not the publication runner's libraries.
depends=('qt6-base>=6.12.0' 'qt6-webengine>=6.11.2' 'qt6-svg>=6.12.0' 'kstatusnotifieritem>=6.30.0' 'kwindowsystem>=6.30.0' 'libgcc>=16.2.1+r23+gd564253eb6c8' 'libstdc++>=16.2.1+r23+gd564253eb6c8' 'glibc>=2.44+r50+g1848099f063e'
         'tmux>=3.7' 'openssh' 'python' 'curl' 'procps-ng' 'hicolor-icon-theme' 'bash' 'tar')
optdepends=('konsole: external KDE terminal integration'
            'wl-clipboard: clipboard transfers on Wayland'
            'xclip: clipboard transfers on X11'
            'nodejs: separately installed native agents and DeepSeek Harness'
            'npm: install Codex and DeepSeek Harness from Accounts'
            'git: Git repository and worktree features'
            'systemd: user service autostart and isolated DeepSeek scopes')
provides=("zerus=$pkgver" 'hgs' 'hgs-tray')
conflicts=('zerus' 'zerus-git' 'zerus-ade-bin')
options=('!strip' '!debug')
source=("https://github.com/ufna/zerus/releases/download/nightly-37851516418/zerus-${pkgver}-arch-${CARCH}.tar.gz")
sha256sums=('efd7dbc93f2a2e0f762b41374a198d33653b22320cd2ed63dc1c93e3ece1abd3')

package() {
    cp -a "$srcdir/zerus-0.37.0-arch-$CARCH/usr" "$pkgdir/"
    mv "$pkgdir/usr/share/licenses/zerus-git" "$pkgdir/usr/share/licenses/$pkgname"
}
