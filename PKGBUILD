# Maintainer: Vladimir Alyamkin <ufna@ufna.dev>
pkgname=zerus-ade-bin
pkgver=0.37.0
pkgrel=1
pkgdesc='An agent development environment for persistent local and remote tmux sessions'
arch=('x86_64')
url='https://github.com/ufna/zerus'
license=('MIT')
# Library floors come from the verified package's .BUILDINFO, never the publisher.
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
conflicts=('zerus' 'zerus-git')
options=('!strip' '!debug')
source=("https://github.com/ufna/zerus/releases/download/v${pkgver}/zerus-${pkgver}-arch-${CARCH}.tar.gz")
sha256sums=('29d33e73c269cdcfccbc7740282208dfde9999259a979a5a04eb9d76e9a660ed')

package() {
    cp -a "$srcdir/zerus-$pkgver-arch-$CARCH/usr" "$pkgdir/"
    mv "$pkgdir/usr/share/licenses/zerus-git" "$pkgdir/usr/share/licenses/$pkgname"
}
