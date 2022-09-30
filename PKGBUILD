# Maintainer: Alexis Janon <kardyne -at- gmail -dot- com>
# Contributor: JR Boyens
# Contributor: sballert <sballert@posteo.de>
# Contributor: Alex Whitt <alex.joseph.whitt@gmail.com>

_pkgsrcname=atom
_pkgmaintainer=file-icons
_pkgdestdirname=atom-file-icons
_versionprefix=v
pkgver=2.1.47
pkgrel=1
pkgdesc="Atom file-specific icons for improved visual grepping."
pkgname=ttf-${_pkgdestdirname}
arch=(any)
url="https://atom.io/packages/file-icons"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_pkgmaintainer}/${_pkgsrcname}/archive/${_versionprefix}${pkgver}.tar.gz")
md5sums=('a91aa916edd75cc29de5067f7cb780e0')
makedepends=('woff2')

build() {
    cd "${_pkgsrcname}-${pkgver}"
    woff2_decompress fonts/file-icons.woff2
}

package() {
  cd "${_pkgsrcname}-${pkgver}"
  install -d $pkgdir/usr/share/fonts/TTF/
  install -m644 fonts/file-icons.ttf "$pkgdir/usr/share/fonts/TTF/${_pkgdestdirname}.ttf"
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
