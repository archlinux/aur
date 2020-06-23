# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Former maintainer: Tom Richards <tom@tomrichards.net> https://github.com/t-richards/aur-editorconfig-gedit

pkgname=editorconfig-gedit
pkgver=0.5.3
pkgrel=3
pkgdesc="EditorConfig plugin for gedit"
arch=('any')
url="https://editorconfig.org/"
license=('BSD')
depends=('gedit' 'python-editorconfig')
source=("$pkgname-$pkgver.tar.gz::https://github.com/editorconfig/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d6c88a400bfbab36355ab6674db65c0d4997c970fc58a08752c1b331bea625e3')


package() {
  cd "$pkgname-$pkgver"

  _installdir="$pkgdir/usr/lib/gedit/plugins"
  install -d "$_installdir"

  cp -r "editorconfig_plugin/" "$_installdir"
  install "editorconfig.plugin" -t "$_installdir"
  install "editorconfig_gedit3.py" -t "$_installdir"

  sed -i 's/python/python3/' "$_installdir/editorconfig.plugin"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
