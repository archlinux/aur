# Maintainer: liberodark

pkgname=frostwire
pkgver=6.6.3
pkgrel=252
pkgdesc="FrostWire is a free and easy Downloader, BitTorrent Client and Media Player"
arch=('x86_64')
url="http://www.frostwire.com"
license=('custom')
depends=('xdg-utils' 'jre8-openjdk')
optdepends=('mplayer')
source_x86_64=("https://github.com/frostwire/frostwire/releases/download/frostwire-desktop-${pkgver}-build-${pkgrel}/frostwire-${pkgver}.noarch.tar.gz")
source=($pkgname.desktop
        $pkgname.png)
sha512sums=('03cb518e110d09dfe9eb3391d43bb61516f12afe45a94fec022747c9a45e482598935912b687480c6423b1cae1550de5e87e6ad0119f2067f961b6e5e6cd5b9a'
         'f0172d8d8435ddbc96e3f3e8ce6f09869ade1b9a32ef3930ae2f8b2522af121f6b2d37e9e8eb081561715845d9bb73f027c848a3756126d3ac989a861bfe2a4e')
sha512sums_x86_64=('c2880d594cbdc3ebc7c6e8b897514ddc82056fc2ecb0755f731777a8c323ecad3f1c34e709e280a15c668e01456ddeb2ddd8808322f60bcc297a776efe1ebc07')
        
package() {
  cd $srcdir
  tar xvf frostwire-${pkgver}.noarch.tar.gz
  mkdir -p "$pkgdir/usr/bin/frostwire/"
  cp -r "frostwire-${pkgver}.noarch/." "$pkgdir/usr/bin/frostwire/"
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
