# Maintainer: he3als <he3als@users.noreply.github.com>
pkgname=discord-canary-prerelease-patched-electron-bin
pkgver=20261024.162607
pkgrel=1
pkgdesc='Discord Canary with patched prerelease Electron and Linux fixes (AVX2 required)'
arch=('x86_64')
url='https://github.com/discord-patched-electron/discord-patched-electron'
license=('LicenseRef-Discord' 'MIT' 'BSD-3-Clause')
depends=('glibc>=2.38' gcc-libs alsa-lib gtk3 libcups libxss libxtst nss libdrm mesa libpulse python bash coreutils pipewire pipewire-audio zenity)
optdepends=('xdg-desktop-portal: desktop screen selection' 'wireplumber: PipeWire session management' 'kdotool: KDE Plasma window labels')
options=('!strip' '!debug')
install=discord.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/discord-patched-electron/discord-patched-electron/releases/download/canary-1.0.2365-8748f4696bd6b2f6/discord-canary-prerelease-patched-electron-bin-linux-x86_64.tar.gz")
sha256sums=('e01900cea2797e0c4d0a5eda426c9d0609476905678128c3a590baab87cddb2e')

package() {
  install -dm755 "$pkgdir/opt" "$pkgdir/usr/bin"
  cp -a "$srcdir/$pkgname" "$pkgdir/opt/$pkgname"
  ln -s "/opt/$pkgname/launch.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname/io.github.discord_patched_electron.DiscordCanary.desktop" \
    "$pkgdir/usr/share/applications/io.github.discord_patched_electron.DiscordCanary.desktop"
  install -Dm644 "$srcdir/$pkgname/discord.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  cp -a "$srcdir/$pkgname/licenses/." "$pkgdir/usr/share/licenses/$pkgname/"
}
