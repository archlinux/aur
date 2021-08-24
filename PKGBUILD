# Maintainer: santost12 <santost12 AT noreply DOT archlinux DOT org>

pkgname=darkmx
pkgver=1.17
pkgrel=1
pkgdesc="Decentralized communication app that utilizes Tor hidden services to allow you to easily have an anonymous, reliable, and censorship-resistant presence on the internet."
arch=('i686' 'x86_64')
url='http://darkmx.app/'
license=('custom:darkmx')
depends=('gtk2' 'hicolor-icon-theme' 'dbus-glib')
optdepends=('gconf: for shell integration')
install='darkmx.install'
source=('LICENSE')
source_i686=("https://download.darkmx.app/darkmx-1.17-linux32.tar.gz")
source_x86_64=("https://download.darkmx.app/darkmx-1.17-linux64.tar.gz")
sha256sums=('c4adbd46bfdeaf329fa03c578960b157f211a3626c532ae168be9d60514ef0d0')
sha256sums_i686=('5477fe33b2a45100d52bcaa9b90d5efa8561ba3469e054ceb089585246434b83')
sha256sums_x86_64=('3c157a558072ddda4ba9c014172578ae21b3d74817ad1c43977ff72782e8a515')

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
