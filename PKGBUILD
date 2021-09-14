# Maintainer: santost12 <santost12 AT noreply DOT archlinux DOT org>

pkgname=darkmx
pkgver=1.21
pkgrel=1
pkgdesc="Decentralized communication app that utilizes Tor hidden services to allow you to easily have an anonymous, reliable, and censorship-resistant presence on the internet."
arch=('i686' 'x86_64')
url='http://darkmx.app/'
license=('custom:darkmx')
depends=('gtk2' 'hicolor-icon-theme' 'dbus-glib')
optdepends=('gconf: for shell integration')
install='darkmx.install'
source=('LICENSE')
source_i686=("https://download.darkmx.app/darkmx-1.21-linux32.tar.gz")
source_x86_64=("https://download.darkmx.app/darkmx-1.21-linux64.tar.gz")
sha256sums=('c4adbd46bfdeaf329fa03c578960b157f211a3626c532ae168be9d60514ef0d0')
sha256sums_i686=('6e704654b0fd712a471aca55592aea7238adccd983f75e34e01cb1ac2e1c2b9d')
sha256sums_x86_64=('f8c56900df6c4bf25f29b91c69bd6a7598e10e21d87044568774a2bb5d539447')

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
