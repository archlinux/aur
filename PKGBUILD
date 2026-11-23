# Maintainer: leychan <leychan_@outlook.com>
pkgname=shiyi-translator-bin
pkgver=0.3.8
pkgrel=12
pkgdesc='Desktop translator with configurable translation services'
arch=('x86_64')
url=https://github.com/leychan/shiyi-translator
license=('unknown')
depends=('glibc>=2.34' gcc-libs gtk3 libsecret libayatana-appindicator espeak-ng)
optdepends=('wl-clipboard: Wayland selection capture' 'xclip: X11 selection capture')
provides=("shiyi-translator=$pkgver")
conflicts=('shiyi-translator')
options=('!strip' '!debug')
_archive=shiyi-translator-0.3.8-12-x86_64.pkg.tar.zst
source=(https://github.com/leychan/shiyi-translator/releases/download/v0.3.8/shiyi-translator-0.3.8-12-x86_64.pkg.tar.zst)
noextract=("$_archive")
sha256sums=('ef87ff42e888e989c462ff34908eb5874d30b410c0718d6518a9c68b3a7dc24a')

package() {
    # Let makepkg set ownership and generate fresh metadata for the -bin package.
    bsdtar --no-same-owner -xf "$srcdir/$_archive" -C "$pkgdir" opt usr
}
