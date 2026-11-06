# Maintainer: Vladimir Alyamkin <ufna@ufna.dev>
pkgname=zerus-ade-bin
pkgver=0.48.1
pkgrel=1
pkgdesc='Agent development environment for AI coding agents across your machines'
arch=('x86_64')
url='https://github.com/ufna/zerus'
license=('MIT')
# Library floors come from the verified package's .BUILDINFO, never the publisher.
depends=('webkit2gtk-4.1>=2.54.2' 'gtk3>=1:3.24.52' 'gdk-pixbuf2>=2.44.8' 'glib2>=2.90.1' 'cairo>=1.18.6' 'libsoup3>=3.8.1' 'alsa-lib>=1.2.16.1' 'gstreamer>=1.28.8' 'gst-plugins-base-libs>=1.28.8' 'libappindicator>=12.10.1' 'dbus>=1.16.2' 'libgcc>=16.2.1+r23+gd564253eb6c8' 'libstdc++>=16.2.1+r23+gd564253eb6c8' 'glibc>=2.44+r50+g1848099f063e'
         'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav'
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
sha256sums=('e8b2f628fa7a09b6f1be0cef2a541b9b504593e9d4ab32711851892270dc266e')

package() {
    cp -a "$srcdir/zerus-$pkgver-arch-$CARCH/usr" "$pkgdir/"
    mv "$pkgdir/usr/share/licenses/zerus-git" "$pkgdir/usr/share/licenses/$pkgname"
}
