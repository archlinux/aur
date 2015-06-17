# Maintainer: David Vogt <dave at winged dot ch>
# This PKGBUILD is maintained at https://github.com/winged/aur-packages

pkgname=libtermkey-git
pkgver=0.r351.87a4d22
pkgrel=1
pkgdesc="This library allows easy processing of keyboard entry from terminal-based programs. It handles all the necessary logic to recognise special keys, UTF-8 combining, and so on, with a simple interface."
arch=('x86_64' 'i686')
license=('MIT')
url=('http://www.leonerd.org.uk/code/libtermkey/')
#depends=()
provides=('libtermkey')
conflicts=('libtermkey')
#makedepends=('python2-setuptools')
source=("$pkgname::git://github.com/neovim/libtermkey.git"
        "LICENSE::https://raw.githubusercontent.com/neovim/libtermkey/master/LICENSE")
sha256sums=('SKIP' 'd2d251b07bfd2cf6b32cf392752975a693be89dd1f0baa712ee6b5e20b9c0835')
pkgver() {
  cd "${pkgname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
