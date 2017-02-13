# Maintainer: ahrs <Forward dot to at hotmail dot co dot uk>

pkgname='undistract-me-git'
pkgver='r58.3c3054c'
pkgrel=4

arch=('any')
url="https://github.com/jml/undistract-me"
depends=('bash')
optdepends=('zsh')
conflicts=('undistract-me')
licenseURL="https://raw.githubusercontent.com/jml/undistract-me/master/LICENSE"
license=("custom","$licenseURL")
pkgdesc="Notifies you when long-running terminal commands complete"
source=("git+https://github.com/jml/undistract-me.git")
md5sums=('SKIP')
install='undistract-me.install'

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "$pkgdir/usr/share/undistract-me"

  cp "$srcdir/${pkgname%-git}/"{*.bash,*.sh} "$pkgdir/usr/share/undistract-me"

  install -D -m644 "$srcdir/${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
