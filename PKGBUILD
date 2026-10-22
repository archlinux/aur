# Maintainer: iqzer0 <iqzer0@users.noreply.github.com>
#
# Kumiko from the release build (the tarball CI attaches to each GitHub
# release). To build from source instead, see ../kumiko/PKGBUILD.
# packaging/aur/update.sh sets _ver and the checksum for a release.

pkgname=kumiko-bin
_ver=2.0.0
pkgver=2.0.0
pkgrel=1
pkgdesc="Tiling terminal emulator for Linux, built on ttyx_ and Tilix"
arch=('x86_64')
url="https://github.com/iqzer0/kumiko"
license=('MPL-2.0')
depends=('glibc' 'gcc-libs' 'gtk3' 'vte3' 'libsecret' 'libx11')
optdepends=('gsettings-desktop-schemas: system monospace font, dark-mode preference and proxy settings'
            'dconf: one-time import of ttyx_ settings')
provides=('kumiko')
conflicts=('kumiko')
options=('!strip' '!debug')
source=("https://github.com/iqzer0/kumiko/releases/download/v${_ver}/kumiko-${_ver}-linux-x86_64.tar.gz")
sha256sums=('0bc8c74ebd522df3ab82ace02b31ba85894122ac55e4f7f80faa2b9f1a0cd706')

package() {
    cp -a --no-preserve=ownership "$srcdir/usr" "$pkgdir/"
}
