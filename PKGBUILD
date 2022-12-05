# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
pkgname=wget-xdg-bin
pkgver=1.21.3
pkgrel=1
pkgdesc='Network utility to retrieve files from the Web - but moving ~/.wget-hsts to $XDG_CACHE_HOME/wget/hsts'
arch=('x86_64')
license=('GPL3')
depends=('glibc' 'zlib' 'gnutls' 'libidn2' 'libidn2.so' 'util-linux-libs' 'libuuid.so'
         'libpsl' 'libpsl.so' 'pcre2' 'nettle' 'libnettle.so')
optdepends=('ca-certificates: HTTPS downloads')
source=("https://github.com/noahvogt/${pkgname%-*}-aur/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-$arch.pkg.tar.zst")
sha256sums=('1149eedf7c15f2c8cca117600ca7cef971d45fee3f065dfa2adef9a9f95c27b0')
backup=('etc/wgetrc')
provides=('wget')
conflicts=('wget')

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"
    cp -R "${srcdir}/etc/" "${pkgdir}/etc"
}
