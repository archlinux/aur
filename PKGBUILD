# Maintainer: Milo Gilad <myl0gcontact@gmail.com>
pkgname=cloudconvert-cli-git
pkgver=1.0.0
pkgrel=1
pkgdesc='Command Line Interface for CloudConvert'
arch=('any')
url='https://github.com/cloudconvert/cloudconvert-cli'
license=('unknown')
depends=(nodejs coffeescript)
makedepends=(npm git)
source=("git+https://github.com/cloudconvert/cloudconvert-cli.git")
sha512sums=('SKIP')

build() {
  cd "${pkgname%-git}"
  npm install --production
}

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules"
  mkdir -p "$_npmdir/${pkgname%-git}"
  cp -R "${pkgname%-git}/." "$_npmdir/${pkgname%-git}"
  local _bindir="$pkgdir/usr/bin"
  mkdir -p "$_bindir"
  ln -s "/usr/lib/node_modules/${pkgname%-git}/lib/bin.js" "$_bindir/${pkgname%-cli-git}"
}
