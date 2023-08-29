# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: François-Xavier Bru <francoisxavier.bru at orange dot com>

_pkgname=application-inspector
pkgname=$_pkgname-bin
pkgver=1.9.10
pkgrel=2
pkgdesc="Microsoft ApplicationInspector is a source code analyzer built for surfacing features of interest and other characteristics to answer the question 'what's in it' using static analysis with a json based rules engine (official CLI binary version)"
arch=('x86_64')
url="https://github.com/microsoft/ApplicationInspector"
license=('MIT')
depends=(dotnet-runtime)
conflicts=($_pkgname)
provides=($_pkgname)
options=(staticlibs)
source=($url/releases/download/v$pkgver/ApplicationInspector_linux_$pkgver.zip)
sha256sums=('a040b2d88033cd8a20b4a081a6bba446d7c4d8c5e8a3e54dbff12ae225c9d322')
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
