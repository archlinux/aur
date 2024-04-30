# Maintainer: cyprus187 <cyprus187 AT noreply DOT archlinux DOT org>
# Contributor: santost12 <santost12 AT noreply DOT archlinux DOT org>

pkgname=darkmx
pkgver=1.34
pkgrel=2
pkgdesc="Decentralized communication app that utilizes Tor hidden services to allow you to easily have an anonymous, reliable, and censorship-resistant presence on the internet."
arch=('x86_64')
url='http://darkmx.app/'
license=('custom:darkmx')
depends=('gtk2' 'hicolor-icon-theme' 'dbus-glib')
optdepends=('gconf: for shell integration')
install='darkmx.install'
source=('LICENSE')
source_x86_64=("https://download.darkmx.app/darkmx-1.34-linux64.tar.gz")
sha256sums=('c4adbd46bfdeaf329fa03c578960b157f211a3626c532ae168be9d60514ef0d0')
sha256sums_x86_64=('e7062a00049f997fb0566dd49bb7691f28eb10ef79aff6203c72f9f418e068f5')

package() {
  if [ "$CARCH" == "x86_64" ]
  then
    cd "$srcdir/$pkgname-${pkgver}-linux64"
  fi

  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
