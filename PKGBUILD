# Maintainer: jakob <grandchild@gmx.net>

pkgname=autohidewibox
pkgver=0.7
pkgrel=1
pkgdesc="Show awesome WM wibox only on ModKey press"
url=https://github.com/grandchild/${pkgname}
#install=${pkgname}.install
changelog=.Changelog
license=('CC0')
arch=('i686' 'x86_64')
provides=("${pkgname}")
conflicts=("${pkgname}")
depends=('awesome' 'python' 'xorg-xinput')
source=(
  "https://raw.githubusercontent.com/grandchild/${pkgname}/${pkgver}/${pkgname}.py"
  "https://raw.githubusercontent.com/grandchild/${pkgname}/${pkgver}/${pkgname}.conf"
)
sha256sums=(
  '793b0badec78dc04c91b847aaaea4eb660db58d3578941a78f696ad8446f58d6'
  'ae8b15fc73d62428360b7e016c6294a5d688cd9b0edc4c7cc1a49ca35c5947cc'
)

package() {
  cd $srcdir/
  install -d $pkgdir/usr/bin
  install -Dm755 ${pkgname}.py $pkgdir/usr/bin/
  install -d $pkgdir/etc
  install -Dm644 ${pkgname}.conf $pkgdir/etc/
}
