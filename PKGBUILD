# Maintainer: santost12 <santost12 AT noreply DOT archlinux DOT org>

pkgname=darkmx
pkgver=1.23
pkgrel=1
pkgdesc="Decentralized communication app that utilizes Tor hidden services to allow you to easily have an anonymous, reliable, and censorship-resistant presence on the internet."
arch=('i686' 'x86_64')
url='http://darkmx.app/'
license=('custom:darkmx')
depends=('gtk2' 'hicolor-icon-theme' 'dbus-glib')
optdepends=('gconf: for shell integration')
install='darkmx.install'
source=('LICENSE')
source_i686=("https://download.darkmx.app/darkmx-1.23-linux32.tar.gz")
source_x86_64=("https://download.darkmx.app/darkmx-1.23-linux64.tar.gz")
sha256sums=('c4adbd46bfdeaf329fa03c578960b157f211a3626c532ae168be9d60514ef0d0')
sha256sums_i686=('e0cb13213970263ff3a05a90a2aa4357894c3a1021da8a51a90b43ce085b42c4')
sha256sums_x86_64=('c8609699a965ea3517373bb567e9353fb5b64f0780fbecb346b8cee78ca643da')

package() {
  if [ "$CARCH" == "x86_64" ]
  then
    cd "$srcdir/$pkgname-${pkgver}-linux64"
  fi

  if [ "$CARCH" == "i686" ]
  then
    cd "$srcdir/$pkgname-${pkgver}-linux32"
  fi

  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.png \
    "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 $pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
