# Maintainer: Vladimir Alyamkin <ufna@ufna.dev>
pkgname=zerus-ade-nightly-bin
pkgver=0.45.1.r2050.g7eaac41.n22
pkgrel=1
pkgdesc='Agent development environment for AI coding agents across machines (nightly)'
arch=('x86_64')
url='https://github.com/ufna/zerus'
license=('MIT')
# Floors describe the tested binary, not the publication runner's libraries.
depends=('qt6-base>=6.12.0' 'qt6-multimedia>=6.12.0' 'qt6-svg>=6.12.0' 'kstatusnotifieritem>=6.31.0' 'kwindowsystem>=6.31.0' 'kidletime>=6.31.0' 'libgcc>=16.2.1+r23+gd564253eb6c8' 'libstdc++>=16.2.1+r23+gd564253eb6c8' 'glibc>=2.44+r50+g1848099f063e'
         'tmux>=3.7' 'openssh' 'python' 'curl' 'procps-ng' 'hicolor-icon-theme' 'bash' 'tar')
optdepends=('konsole: external KDE terminal integration'
            'qt6-webengine: embedded DeepSeek Native UI'
            'wl-clipboard: clipboard transfers on Wayland'
            'xclip: clipboard transfers on X11'
            'nodejs: separately installed native agents and DeepSeek Harness'
            'npm: install Codex and DeepSeek Harness from Accounts'
            'git: Git repository and worktree features'
            'systemd: user service autostart and isolated DeepSeek scopes')
provides=("zerus=$pkgver" 'hgs' 'hgs-tray')
conflicts=('zerus' 'zerus-git' 'zerus-ade-bin')
options=('!strip' '!debug')
source=("https://github.com/ufna/zerus/releases/download/nightly-39371681298/zerus-${pkgver}-arch-${CARCH}.tar.gz")
sha256sums=('a717fea9f6c0efdff9189f88e4029881a9ed9e97da43f05518a66fff1f682b55')

package() {
    cp -a "$srcdir/zerus-0.45.1-arch-$CARCH/usr" "$pkgdir/"
    mv "$pkgdir/usr/share/licenses/zerus-git" "$pkgdir/usr/share/licenses/$pkgname"
}
