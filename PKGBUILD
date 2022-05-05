#!/hint/bash -e
# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Vasil Yonkov <bustervill at gmail dot com>
# Contributor: Guten Ye <ywzhaifei [at] gmail [dot] com>

pkgname=ruby-build-git
pkgver=20220426.r1.gc0d87ea
pkgrel=1
pkgdesc="Compile and install Ruby"
arch=('any')
url="https://github.com/rbenv/${pkgname%-git}"
license=("MIT")
depends=('bash')
makedepends=('git')
provides=('ruby-build')
conflicts=('ruby-build')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "${pkgname%-git}"
  PREFIX="$pkgdir/usr" ./install.sh
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
