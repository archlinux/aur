_npmname=semantic-release-cli
pkgname=nodejs-$_npmname
pkgver=5.4.6 # renovate: datasource=github-tags depName=semantic-release/cli
pkgrel=1
pkgdesc="setup automated semver compliant package publishing"
arch=(any)
url="https://github.com/semantic-release/cli"
license=('MIT')
depends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('5231a537cc3c094fd8e18f97a4a767b84af26f294e36a7e15e30e218a0db6fa7')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  chmod -R go-w "$pkgdir"/usr
}

