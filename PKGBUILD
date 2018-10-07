#Maintainer: Julian Xhokaxhiu <info at julianxhokaxhiu dot com>

pkgname=getmu
pkgver=1.5.5
pkgrel=1
pkgdesc="A full-stack DevOps on AWS framework"
arch=('i686' 'x86_64')
source_i686=("https://github.com/stelligent/mu/releases/download/v$pkgver/mu-linux-386")
source_x86_64=("https://github.com/stelligent/mu/releases/download/v$pkgver/mu-linux-amd64")
url="https://github.com/stelligent/mu"
license=("MIT")
md5sums_i686=("6f693bc8139ee4d60adaada39bf6f689")
md5sums_x86_64=("8320d0675ff3f00249a47b18146de926")

package() {
  _ARCH=""

  # Update the architecture name based on the current one running this PKGBUILD
  if [ "$CARCH" == "i686" ]; then
    _ARCH="386"
  elif [ "$CARCH" == "x86_64" ]; then
    _ARCH="amd64"
  fi

  cd "$srcdir"
  chmod +x "mu-linux-$_ARCH"
  install -Dm755 "mu-linux-$_ARCH" "$pkgdir/usr/bin/mu"
}
