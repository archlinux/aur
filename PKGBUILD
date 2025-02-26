pkgname=tempesta
pkgver=0.0.44
pkgrel=1
pkgdesc="The fastest and lightest bookmark manager CLI written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/tempesta"
license=('MIT')
depends=('glibc')

case "$arch" in
  "x86_64")
    source=("https://github.com/x71c9/tempesta/releases/download/v0.0.44/tempesta-x86_64-unknown-linux-gnu.tar.gz")
    sha256sums=('SKIP')
    ;;
  "aarch64")
    source=("https://github.com/x71c9/tempesta/releases/download/v0.0.44/tempesta-aarch64-unknown-linux-gnu.tar.gz")
    sha256sums=('SKIP')
    ;;
  *)
    echo "Error: Unsupported architecture $arch. Please open a github issue if you want to support it: https://github.com/x71c9/tempesta/issues" >&2
    exit 1
    ;;
esac

package() {
  install -Dm755 "${srcdir}/tempesta" "${pkgdir}/usr/bin/tempesta"
}
