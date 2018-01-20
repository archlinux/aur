# Maintainer: liberodark

pkgname=frostwire
pkgver=6.6.2
pkgrel=250
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
sha512sums_x86_64=('516c534f4529d2ec84a77afa84a20e69dff12ee60694ff41dfd1098c4d39011d24391b7953e81bbf8eae02baf55ed6e2304d75464b632c1a6c458dda52344423')
        
package() {
  cd $srcdir
  tar xvf frostwire-${pkgver}.noarch.tar.gz
  mkdir -p "$pkgdir/usr/bin/frostwire/"
  cp -r "frostwire-${pkgver}.noarch/." "$pkgdir/usr/bin/frostwire/"
  install -vDm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -vDm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
