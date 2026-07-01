# Maintainer: vaishnav <vaishnav.sabari.girish@gmail.com>

pkgname=kanarenshu-bin
_pkgname=kanarenshu
pkgver=0.1.0
pkgrel=1
pkgdesc="A minimal TUI application to practise Japanese from the terminal. (Pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/nuixyz/kanarenshu"
license=('MIT')
depends=('glibc')
provides=("$_pkgname")
conflicts=("$_pkgname")

source_x86_64=("${_pkgname}_Linux_x86_64.tar.gz::https://github.com/nuixyz/kanarenshu/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_aarch64=("${_pkgname}_Linux_arm64.tar.gz::https://github.com/nuixyz/kanarenshu/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  # Install the executable binary
  install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin/"

  # Note: Pre-compiled archives sometimes include README/LICENSE files.
  # If they are extracted alongside the binary, we can install them.
  if [ -f "README.md" ]; then
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
  fi
  if [ -f "LICENSE" ]; then
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
  fi
}
