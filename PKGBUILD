# Maintainer:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: mac <poczciwiec at gmail dot com>

pkgname=vterm
_pkgname=Vterm
pkgver=0.2.1
pkgrel=1
pkgdesc="Yet Another Terminal, a Terminal Emulator written with the web languages of the future. Today. Extensible, themeable."
arch=("i686" "x86_64")
url="https://github.com/vterm/vterm"
license=("MIT")
depends=('nodejs')
provides=("vterm")
conflicts=('vterm')
source=("https://raw.githubusercontent.com/vterm/vterm/master/LICENSE.md")
  source_i686=("$url/releases/download/v$pkgver/${pkgname}_${pkgver}_i386.deb")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname}_${pkgver}_amd64.deb")
sha512sums=('aba0946300754a54c429d74360d41c1e394a40c55f721449ee27f5a1b912100fd26c7f04f2f215d3986bcd97ee24943ed3b333830830f46f029d0f2d1f881bb6')
sha512sums_i686=('58ba38f58cb0693ae69137679d52cf27b3ce5b97300aee395f7d9a187ecc307b1e1d7ea220d5f4c72ca420483075754e69dac98d185ab8c2d9a539af1b06c0f9')
sha512sums_x86_64=('fa4662b7b2d3c255eb11e9e8d9af25a8731afe3c52524f7f23ec8a04de7c9fe84937dbbde4cc2d39a5f71ad1f8b0e90dbd7ba7a8efe23bce32f7f12df608465f')

 
prepare() {
  cd $srcdir

  msg2 "  -> Extracting files..."
  tar -xf data.tar.xz

  msg2 "  -> Fixing executable stack..."
}

package() {
  cd $srcdir

  msg2 "  -> Installing program..."

  cp -r opt/ $pkgdir/

  install -d $pkgdir/usr/bin
  ln -s /opt/VTerm/$pkgname $pkgdir/usr/bin/$pkgname

  cp -r usr $pkgdir/

  install -Dm755 LICENSE.md $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}
