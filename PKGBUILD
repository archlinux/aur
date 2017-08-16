# Maintainer:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: mac <poczciwiec at gmail dot com>

pkgname=vterm
_pkgname=Vterm
pkgver=0.2.2
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
sha512sums_i686=('18aff3323038bbf72710ca7808ff52862cdf0153c1084a4c7577f90f4ee34bed61971375efb12c321014f9f69b021c775776fa80add9ca07a36dee8668b9e0c8')
sha512sums_x86_64=('6f2d4feb113021c92fd65707536f2693c9812411f9c3fe5b4348c24c675c12d40ad869e629bd485b674d5bf76fd868345258351226ac4bfdf15f14fe18e3879e')

 
prepare() {
  cd $srcdir

  msg2 "  -> Extracting files..."
  tar -xf data.tar.xz
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
