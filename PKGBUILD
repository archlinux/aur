# Maintainer: leychan <leychan_@outlook.com>
pkgname=shiyi-translator-bin
pkgver=0.3.7
pkgrel=11
pkgdesc='Desktop translator with configurable translation services'
arch=('x86_64')
url=https://github.com/leychan/shiyi-translator
license=('unknown')
depends=('glibc>=2.34' gcc-libs gtk3 libsecret libayatana-appindicator espeak-ng)
optdepends=('wl-clipboard: Wayland selection capture' 'xclip: X11 selection capture')
provides=("shiyi-translator=$pkgver")
conflicts=('shiyi-translator')
options=('!strip' '!debug')
_archive=shiyi-translator-0.3.7-11-x86_64.pkg.tar.zst
source=(https://github.com/leychan/shiyi-translator/releases/download/v0.3.7/shiyi-translator-0.3.7-11-x86_64.pkg.tar.zst)
noextract=("$_archive")
sha256sums=('db135c467cb7b5ac717a552e6448b11780a48f987b1a775e202a989b73bc8b64')

package() {
    # Let makepkg set ownership and generate fresh metadata for the -bin package.
    bsdtar --no-same-owner -xf "$srcdir/$_archive" -C "$pkgdir" opt usr
}
