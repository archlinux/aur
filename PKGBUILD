# Maintainer: xihale <xihale.top@qq.com>

## options
: ${_pkgtype:=-bin}

pkgname="unlock-music-cli$_pkgtype"
pkgver=0.2.0.beta.2
pkgrel=1
pkgdesc="Unlock Music Project - CLI Edition"
arch=("arm" "x86_64"  "i686")
license=('MIT')
url="https://git.unlock-music.dev/um/cli"

if [ $CARCH = "x86_64" ]; then
  _arch="amd64"
  sha256sums=('ac223b14bd9ca850cbc006860667a38ade222af572d4ed774a1937a27d0adef1')
elif [ $CARCH = "i686" ]; then
  _arch="386"
  sha256sums=('5e86178f10add4760e4e734acd8b6ec58380d48a4a5d08013bb7f6de21dc2e2f')
elif [ $CARCH = "arm" ]; then
  _arch="arm64"
  sha256sums=('7270f06a9630cfc59d6ea28e67dab44c1e0a417fd7d89a13c509a4991e6f619c')
fi

source=(
  https://git.unlock-music.dev/um/cli/releases/download/v0.2.0-beta.2/um-linux-$_arch.tar.gz
)


package() {

  tar -xf "um-linux-$_arch.tar.gz"

  install -Dm755 "$srcdir/um" -t "$pkgdir/usr/bin/"

  echo "Usage"
  echo "./um [-o <output dir>] [-i] <input dir/file>"
  echo "./um -h to show help menu"

}
