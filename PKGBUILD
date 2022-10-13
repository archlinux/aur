# Maintainer: Zeal Wierslee <zeal@wierslee.me>
pkgname=sugarjar
pkgver=0.0.11
pkgrel=1
pkgdesc="A git/github helper inspired by arcanist (and others)"
arch=('x86_64')
url="https://github.com/jaymzh/sugarjar"
license=('Apache')
depends=('git' 'hub' 'libxcrypt-compat')
source=("https://github.com/jaymzh/sugarjar/releases/download/v$pkgver/sugarjar_$pkgver-${pkgrel}_amd64-ubuntu2004.deb")
sha256sums=("d8818dcb66b2da24647c6a2cceb640cb5f69a1a45a96497f537822723a616e82")

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.xz -C "$pkgdir"

  # link executables
  mkdir -p $pkgdir/usr/bin

  ln -s /opt/sugarjar/bin/sj $pkgdir/usr/bin/ || error_exit "Cannot link sj to /usr/bin"
  chown -Rh 0:0 $pkgdir
  chown -R 755 $pkgdir/opt
}
