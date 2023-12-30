# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: François-Xavier Bru <francoisxavier.bru at orange dot com>

_pkgname=application-inspector
pkgname=$_pkgname-bin
pkgver=1.9.16
pkgrel=1
pkgdesc="A source code analyzer built for surfacing features of interest and other characteristics to answer the question 'What's in the code?' quickly using static analysis with a json based rules engine (binary release)"
url="https://github.com/microsoft/ApplicationInspector"
arch=('x86_64')
license=('MIT')
depends=('dotnet-runtime')
conflicts=("$_pkgname")
provides=("$_pkgname")
options=('staticlibs')
source=("$url/releases/download/v$pkgver/ApplicationInspector_linux_$pkgver.zip")
sha256sums=('4c73a2ec60f67978a299c065b1eb3db98b2c67c6758cc3531efb4855aa3162b2')
install=$pkgname.install

package() {
# Create folders
  mkdir -p "$pkgdir/opt/ApplicationInspector" "$pkgdir/usr/bin"
# Install
  mv ApplicationInspector_linux_$pkgver/* "$pkgdir/opt/ApplicationInspector"
  chmod -R g+w "$pkgdir/opt/ApplicationInspector"
  chmod +x "$pkgdir/opt/ApplicationInspector/ApplicationInspector.CLI"
  ln -s /opt/ApplicationInspector/ApplicationInspector.CLI "$pkgdir/usr/bin/$_pkgname"
}
