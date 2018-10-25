#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=getmu
pkgver=1.5.8
pkgrel=1
pkgdesc="A full-stack DevOps on AWS framework"
arch=('x86_64')
source_x86_64=("https://github.com/stelligent/mu/releases/download/v$pkgver/mu-linux-amd64")
url="https://github.com/stelligent/mu"
license=("MIT")
sha256sums_x86_64=("0f5221d9e6eee56020b4a4c6a25f6e37e401dcf5e46a8a323e96baa8f7c0c23e")

package() {
  _ARCH=""

  # Update the architecture name based on the current one running this PKGBUILD
  if [ "$CARCH" == "x86_64" ]; then
    _ARCH="amd64"
  fi

  cd "$srcdir"
  chmod +x "mu-linux-$_ARCH"
  install -Dm755 "mu-linux-$_ARCH" "$pkgdir/usr/bin/mu"
}
