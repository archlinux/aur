pkgname=nginx-config-formatter-git
pkgver=r43.e942e40
pkgrel=1
pkgdesc="nginx config file formatter/beautifier written in Python. "
depends=('python')
license=('Apache 2.0')
arch=('any')
url="https://github.com/slomkowski/nginx-config-formatter"
source=($pkgname::git+$url)
sha256sums=('SKIP')


pkgver() {
  cd "${srcdir}/${pkgname}"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 nginxfmt.py "$pkgdir/usr/bin/nginxfmt.py"
}
