# Maintainer: Skunnyk <skunnyk@archlinux.fr>

pkgname=castnow-git
pkgver=r122.3face9f
pkgrel=1
pkgdesc="A commandline chromecast player"
arch=('any')
makedepends=('git')
url="https://github.com/xat/castnow"
license=('MIT')
depends=('nodejs' 'npm')
conflicts=('castnow')
source=($pkgname::git://github.com/xat/castnow.git)
md5sums=(SKIP)

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $pkgname
    mkdir -p $pkgdir/usr
    npm install --user root -g --prefix="$pkgdir/usr"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

