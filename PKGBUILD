# Maintainer: Zeal Wierslee <zeal@wierslee.me>
pkgname=sugarjar
pkgver=0.0.9
pkgrel=1
pkgdesc="A git/github helper inspired by arcanist (and others)"
arch=('x86_64')
url="https://github.com/jaymzh/sugarjar"
license=('Apache')
depends=('git' 'hub')
source=("https://github.com/jaymzh/sugarjar/releases/download/v$pkgver/sugarjar_$pkgver-${pkgrel}_amd64-ubuntu2004.deb")
sha256sums=("558e7ee3c660b1d0281e6cb1848bcff915ad214f0d2fb8270158a6e78f93390d")

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.xz -C "$pkgdir"

  # link executables
  mkdir -p $pkgdir/usr/bin

  ln -s /opt/sugarjar/bin/sj $pkgdir/usr/bin/ || error_exit "Cannot link sj to /usr/bin"
  chown -Rh 0:0 $pkgdir
  chown -R 755 $pkgdir/opt
}
