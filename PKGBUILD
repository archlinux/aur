# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Vasil Yonkov <bustervill at gmail dot com>
# Contributor: Guten Ye <ywzhaifei [at] gmail [dot] com>

pkgname=ruby-build-git
pkgver=v20141225.r7.g4aeeac2
pkgrel=1
pkgdesc="Compile and install Ruby"
arch=('any')
url="http://github.com/sstephenson/ruby-build"
license=("MIT")
makedepends=('git')
provides=('ruby-build')
conflicts=('ruby-build')
_gitname="ruby-build"
source=("git://github.com/sstephenson/ruby-build.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir"/"$_gitname"
    git describe --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir"/"$_gitname"

  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/ruby-build

  cp bin/* "$pkgdir"/usr/bin
  cp share/ruby-build/* "$pkgdir"/usr/share/ruby-build
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/"$_gitname"/LICENSE
}
