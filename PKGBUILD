# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=rustmius-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="Fast, native, open-source SSH client and host manager for Linux (precompiled binary)"
url="https://github.com/Cleboost/Rustmius"
arch=("x86_64")
depends=("libxkbcommon" "wayland" "libglvnd" "libx11" "libxcursor" "libxrandr" "libxi")
provides=("rustmius")
conflicts=("rustmius")
license=("AGPL-3.0-or-later")

source=("org.rustmius.Rustmius.desktop::https://raw.githubusercontent.com/Cleboost/Rustmius/refs/heads/master/packages/org.rustmius.Rustmius.desktop" "rustmius.png::https://raw.githubusercontent.com/Cleboost/Rustmius/refs/heads/master/packages/rustmius.png" "LICENSE::https://raw.githubusercontent.com/Cleboost/Rustmius/refs/heads/master/LICENSE" "rustmius-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/rustmius-x86_64")
sha256sums=('1498673b59f13bdd2a5beb43d72fc8e9330599324f9a4d70bd52e1d303ad9959'
            'c8c9adc6e26cc54f2b8d8ce41a093b71b5e9e4338d6e278803d87d2a6e94422d'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef'
            '7cb0098392e30b209635f2f588c250aefaa90b0b810feb2e3fa26f706ee4bdee')

package() {
  install -Dm755 "rustmius-${pkgver}-x86_64" "${pkgdir}/usr/bin/rustmius"
  install -Dm644 "org.rustmius.Rustmius.desktop" "${pkgdir}/usr/share/applications/org.rustmius.Rustmius.desktop"
  install -Dm644 "rustmius.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/rustmius.png"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/rustmius/LICENSE"
}

