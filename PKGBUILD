# Maintainer: Maccyber <jonas.enge@gmail.com>
pkgname=gunrc
pkgver=0.1
pkgrel=1
pkgdesc="GunRC - GTK Universal Network Remote Control"
url="https://github.com/maccyber/gunrc"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('python' 'pygtk' 'python-gobject')
optdepends=()
makedepends=('git')
conflicts=()
replaces=()
backup=()
install=''
source=("git+https://github.com/maccyber/gunrc.git")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/share/$pkgname"
  mv gunrc "$pkgdir/opt/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 gunrc.desktop "$pkgdir/usr/share/applications/gunrc.desktop"
  install -Dm755 gunrc.sh "$pkgdir/usr/bin/gunrc"
  install -Dm644 conf/*.xml "$pkgdir/usr/share/$pkgname/"
}

