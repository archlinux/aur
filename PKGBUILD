# Maintainer: Oleg Reich <root (at) archlinux (dot) guru>

pkgname=slim-sexy
pkgver=0.1
pkgrel=1
pkgdesc="Theme's Pack for SLiM (Simple Login Manager)"
arch=('any')
url="https://github.com/FollowMeDown/slim-sexy"
license=('ISC')
optdepends=('slim: Slimple Login Manager')
source=("${url}/archive/${pkgver}.tar.gz"
        "${url}/releases/download/${pkgver}/${pkgver}.tar.gz.sig")
sha256sums=('95a9c449ba1ca486b3144d10e356ba75e68ec0cedb39703e222ed70519dfb698'
            'SKIP')
validpgpkeys=(A61D4D9711403C840E86AEE0A754BB4BA18DE375) # Oleg Reich

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/usr/share/slim/themes"
  cp -r themes/* "$pkgdir"/usr/share/slim/themes
}

# vim:set ts=2 sw=2 et:
