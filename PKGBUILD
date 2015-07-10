# Maintainer: Patrick Wozniak <email@patwoz.de>

pkgname=masterpassword-cli
pkgver=2.2
pkgrel=2
pkgdesc="CLI version of Master Password."

arch=('any')
url="http://masterpasswordapp.com/"
license=('GPL3')

optdepends=(
  'xclip: copy password to clipboard'
)
makedepends=(
  'openssl'
  'gcc'
  'git'
  'subversion'
)
conflicts=(
  'masterpassword-cli-git'
)

source=("https://ssl.masterpasswordapp.com/$pkgname.tar.gz")
sha256sums=('6ea76592eb8214329072d04f651af99d73de188a59ef76975d190569c7fa2b90')

build() {
	pwd
	targets="mpw" ./build
}

package() {
	pwd

  # run ./install
  # mkdir -p "$bindir"
  # echo -e "$bindir\nn" | ./install
  # rm "$bindir/bashlib"

  install -Dm755 "mpw" "$pkgdir/usr/bin/mpw"
}
