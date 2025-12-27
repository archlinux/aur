# Maintainer: Briar <briar@batforge.dev>
pkgname=music-presence-bin
pkgver=2.3.5
pkgrel=4
pkgdesc="The Discord music status that works with any media player "
arch=('x86_64')
url="https://github.com/ungive/discord-music-presence"
license=('custom')
depends=('brotli' 'bzip2' 'dbus' 'e2fsprogs' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'glib2' 'glibc' 'keyutils' 'krb5' 'libcap' 'libglvnd' 'libpng' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'pcre2' 'systemd-libs' 'zlib' 'zstd')
source=("https://github.com/ungive/discord-music-presence/releases/download/v2.3.5/musicpresence-2.3.5-linux-x86_64.deb" "https://raw.githubusercontent.com/ungive/discord-music-presence/refs/heads/master/LICENSE.md")
sha256sums=('0c4ecc5c49e61eb6998a7205772442e381a04ae2c7d27f2d971f7f018bf39c3e' '569b9fb6be4ae1b2fa4e28ea4fdd1b384f7f0958847b0cdf34f97cadf97ad269')

package() {
  # Extract deb (ar archive)
  bsdtar -xf "musicpresence-2.3.5-linux-x86_64.deb" -C "${srcdir}"

  # Extract data.tar.* into pkgdir
  bsdtar -xf "${srcdir}/data.tar."* -C "${pkgdir}"

  # Install license
  install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

}
