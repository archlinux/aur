# Maintainer: Aleksana QWQ <me@aleksana.moe>

pkgname=polkit-fakesudo
pkgver=0.0.1
pkgrel=1
pkgdesc="A very very stupid fake sudo,using polkit pkexec to grant permissions."
arch=('any')
url='https://github.com/Aleksanaa/polkit-fakesudo'
license=('GPL3')
depends=('bash' 'coreutils' 'gawk' 'polkit')
provides=('sudo')
conflicts=('sudo')
makedepends=('git')
source=("$pkgname::git+$url.git#tag=$pkgver")
md5sums=('SKIP')

package() {
  cd ${pkgname}
  install -Dm755 ./sudo $pkgdir/usr/bin/sudo
  install -Dm755 ./implement.sh $pkgdir/usr/lib/polkit-fakesudo/implement.sh
  install -Dm755 ./help1 $pkgdir/usr/share/polkit-fakesudo/help1
  install -Dm755 ./help2 $pkgdir/usr/share/polkit-fakesudo/help2
}
