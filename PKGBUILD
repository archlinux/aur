# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Army [uli.armbruster (the google thing)]

_pkgname=pim
pkgname=pim-git
pkgver=0.10.1.r0.g2f8d537
pkgrel=4
pkgdesc="Python image viewer with vim-like keybindings. Git-Version"
arch=('any')
url="https://github.com/Narrat/Pim"
license=('MIT')
depends=('desktop-file-utils' 'python-gobject>=3.22')
optdepends=("libheif: support for HEIF/HEIC"
            "libjxl: support for JPEG XL"
            "webp-pixbuf-loader: support for the webp format")
makedepends=('git')
conflicts=('pim')
provides=('pim=0.10.0')
source=('pim::git+https://github.com/Narrat/Pim.git')
md5sums=('SKIP')


pkgver() {
  cd $_pkgname

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $_pkgname

  install -Dm755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  install -D -m644 LICENSE-MIT $pkgdir/usr/share/licenses/${_pkgname}/LICENSE
  install -D -m644 pim.desktop "${pkgdir}/usr/share/applications/pim.desktop"
}
