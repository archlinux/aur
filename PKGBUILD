# Maintainer: James McMurray <jamesmcm03@gmail.com>
pkgname=electric-eye-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Prebuilt electric-eye read-only Linux activity monitor"
arch=('x86_64')
url="https://github.com/jamesmcm/electric-eye"
license=('MIT')
depends=('gcc-libs' 'sqlite' 'systemd-libs' 'pacman')
provides=('electric-eye')
conflicts=('electric-eye')
install=electric-eye.install
# Keep the BPF object and release binaries intact.
options=('!strip' '!debug')
backup=('etc/electric-eye/allowlist.conf' 'etc/electric-eye/config.toml')
source=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/electric-eye-$pkgver-x86_64-bin-r2.tar.gz")
sha256sums=('34463afa3b027371b6b97c8c589d91b531a52fc0a08eef2926fbf93d0e777be2')

package() {
  cp -a "$srcdir/electric-eye-$pkgver-x86_64/." "$pkgdir/"
}

# vim: set ft=sh:
