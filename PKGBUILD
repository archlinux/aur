# Maintainer: lostmason <lostmason@tutamail.com>
# Contributor: cyprus187 <cyprus187 AT noreply DOT archlinux DOT org>
# Contributor: santost12 <santost12 AT noreply DOT archlinux DOT org>

pkgname=darkmx
pkgver=1.42
pkgrel=1
pkgdesc="Decentralized communication app that utilizes Tor hidden services to allow you to easily have an anonymous, reliable, and censorship-resistant presence on the internet."
arch=('x86_64')
url='https://darkmx.app/'
license=('custom:darkmx')
depends=('gtk2' 'hicolor-icon-theme' 'dbus-glib')
optdepends=('gconf: for shell integration')
source=('LICENSE')
source_x86_64=("https://download.darkmx.app/${pkgname}-${pkgver}-linux64.tar.gz")
sha256sums=('c4adbd46bfdeaf329fa03c578960b157f211a3626c532ae168be9d60514ef0d0')
sha256sums_x86_64=('7608510f48df3289f6d16449ccf2e62b724d6f8058826bcf12c4c62c7efb00ce')

package() {
  cd "$srcdir/$pkgname-${pkgver}-linux64"

  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
