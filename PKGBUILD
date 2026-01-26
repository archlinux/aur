# Maintainer: Huang Yifan <yifan0610 at foxmail dot com>

pkgname='catppuccin-lxqt-themes'
pkgver='2.0.0'
pkgrel=1
pkgdesc='LXQT catppuccin themes'
arch=('any')
url='https://github.com/catppuccin/lxqt'
license=('MIT')
makedepends=('git' 'unzip')
depends=('lxqt-config')
source=(
  "git+$url"
  "$url/releases/download/v$pkgver/catppuccin-frappe.zip"
  "$url/releases/download/v$pkgver/catppuccin-latte.zip"
  "$url/releases/download/v$pkgver/catppuccin-macchiato.zip"
  "$url/releases/download/v$pkgver/catppuccin-mocha.zip"
)
sha256sums=('SKIP'
  '2a88cb56a68eaca2a54daa8585ba3a6d5a9c03f3df8e709792ddeb233a1453b4'
  'd6e753d6cb0ad176c13b6821df32cf076fed794033c3d88f5e0360a6f35a7a65'
  'd1fb35aaeafe0dfd09a9ad73b67451be498418b8ff6a7249ee415ffa090b02a3'
  'ebc5e0b02fb47fb1cc340a649b10541b4d8a67641b5b65a76a0114ab74a79426')

package() {
  install -Ddm755 $pkgdir/usr/share/licenses/$pkgname
  install -m644 $srcdir/lxqt/LICENSE $pkgdir/usr/share/licenses/$pkgname

  install -Ddm755 $pkgdir/usr/share/lxqt/themes
  cp -r $srcdir/catppuccin-frappe/ $pkgdir/usr/share/lxqt/themes/
  cp -r $srcdir/catppuccin-latte/ $pkgdir/usr/share/lxqt/themes/
  cp -r $srcdir/catppuccin-macchiato/ $pkgdir/usr/share/lxqt/themes/
  cp -r $srcdir/catppuccin-mocha/ $pkgdir/usr/share/lxqt/themes/
  chmod -R a=rX,u+w $srcdir/catppuccin-frappe
  chmod -R a=rX,u+w $srcdir/catppuccin-latte
  chmod -R a=rX,u+w $srcdir/catppuccin-macchiato
  chmod -R a=rX,u+w $srcdir/catppuccin-mocha
}
