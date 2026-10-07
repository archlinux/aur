# Maintainer: Lenny Angst <lenny at familie-angst dot ch>

_pkgbase=gnome-shell-extension-all-in-one-clipboard
pkgname=${_pkgbase}-bin
pkgver=31
pkgrel=1
pkgdesc="A powerful, integrated clipboard manager for GNOME Shell."
arch=(any)
url=https://github.com/NiffirgkcaJ/all-in-one-clipboard
license=(GPL-3.0-or-later)
depends=(gnome-shell)
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=($pkgname-$pkgver.zip::$url/releases/download/v${pkgver}/all-in-one-clipboard@NiffirgkcaJ.github.com.zip)
sha256sums=('3ea73b690fc2703b56fadd259462777e1512ef8f6c68cf0c8f9c062ef5b62ff5')
noextract=("${pkgname}-${pkgver}.zip")

prepare() {
  cd "$srcdir"
  mkdir -p "${pkgname}-${pkgver}"
  bsdtar -xf "${pkgname}-${pkgver}.zip" -C "${pkgname}-${pkgver}"
}

package() {
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/all-in-one-clipboard@NiffirgkcaJ.github.com"
  cp -r "$srcdir/${pkgname}-${pkgver}/"* "$pkgdir/usr/share/gnome-shell/extensions/all-in-one-clipboard@NiffirgkcaJ.github.com"
}

