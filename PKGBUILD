# Maintainer: Briar <briar@batforge.dev>
pkgname=music-presence-bin
pkgver=2.3.4
pkgrel=3
pkgdesc="The Discord music status that works with any media player "
arch=('x86_64')
url="https://github.com/ungive/discord-music-presence"
license=('custom')
depends=('brotli' 'bzip2' 'dbus' 'e2fsprogs' 'expat' 'fontconfig' 'freetype2' 'gcc-libs' 'glib2' 'glibc' 'keyutils' 'krb5' 'libcap' 'libglvnd' 'libpng' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'pcre2' 'systemd-libs' 'zlib' 'zstd')
source=("https://github.com/ungive/discord-music-presence/releases/download/v2.3.4/musicpresence-2.3.4-linux-x86_64.deb" "https://raw.githubusercontent.com/ungive/discord-music-presence/refs/heads/master/LICENSE.md")
sha256sums=('c5574a7726436d650dddb213a566c2b9fbffce2c4c442ff54ff50d4410f8c43e' '91c04d54bf908cbc42acacbcb05e5bda2e32cc0b63b7eeb98a42cbcbaf3f2151')

package() {
  # Extract deb (ar archive)
  bsdtar -xf "musicpresence-2.3.4-linux-x86_64.deb" -C "${srcdir}"

  # Extract data.tar.* into pkgdir
  bsdtar -xf "${srcdir}/data.tar."* -C "${pkgdir}"

  # Install license
  install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

}
