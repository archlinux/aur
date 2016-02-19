# Maintainer: Azuki <support@azukiapp.com>
pkgname='azk'
pkgver=0.17.0
pkgrel=1
pkgdesc="azk is a lightweight open source development environment orchestration tool. Instantly & safely run any environment on your local machine."
arch=('x86_64')
url="https://github.com/azukiapp/azk"
license=('Apache')
depends=('libnss-resolver' 'docker' 'rsync')
makedepends=('make' 'fakeroot' 'git')
conflicts=(${pkgname}-git)
source=("https://github.com/azukiapp/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('76c3e0c5e81c85571fb3d315db29b6fc')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make -e package_linux
  cp -a "$srcdir/$pkgname-$pkgver/package/v$pkgver/." "$pkgdir/"
}
