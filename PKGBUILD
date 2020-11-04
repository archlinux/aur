 
# Maintainer: Quentin Bouvet <qbouvet at outlook dot com>
pkgname=file-roller-kde-service-menu
pkgver=1.0.0
pkgrel=1
pkgdesc="File-roller 'Extract' and 'Compress' options in dolphin right-click menu"
arch=('any')
url="https://codeload.github.com/gist/9fc3d96078bbc7c30333046a0117e479/zip/a195f38ba9380250e886dcb81406afb67b773c87"
license=('Unknown')
depends=('file-roller' 'dolphin')

source=("${pkgname}-${pkgver}.zip::https://gist.github.com/qbouvet/9fc3d96078bbc7c30333046a0117e479/archive/a195f38ba9380250e886dcb81406afb67b773c87.zip")
sha256sums=('00ed0ce2b03f53fd9a076cb2a1911b5ab797f51cd28ac1231a7b9c94f5d1c966')

prepare() {
    cd "$srcdir"
    rm -rf "${pkgname}-${pkgver}"
    mv "9fc3d96078bbc7c30333046a0117e479-a195f38ba9380250e886dcb81406afb67b773c87" "${pkgname}-${pkgver}"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m0755 -t "$pkgdir/usr/share/kservices5/ServiceMenus/" \
    "$srcdir/$pkgname-$pkgver/fileroller_servicemenu.desktop" \
    "$srcdir/$pkgname-$pkgver/fileroller_addtoservicemenu.desktop" 
}

#
# makepkg --printsrcinfo > .SRCINFO
#
