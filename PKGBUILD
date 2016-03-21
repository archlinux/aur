# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Vasil Yonkov <bustervill at gmail dot com>
# Contributor: Guten Ye <ywzhaifei [at] gmail [dot] com>

pkgname=ruby-build-git
pkgver=v20160228.r5.g522f3ba
pkgrel=1
pkgdesc="Compile and install Ruby"
arch=('any')
url="http://github.com/rbenv/ruby-build"
license=("MIT")
makedepends=('git')
provides=('ruby-build')
conflicts=('ruby-build')
_gitname="ruby-build"
source=("git://github.com/rbenv/ruby-build.git")
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

# vim:set ts=2 sw=2 et:
