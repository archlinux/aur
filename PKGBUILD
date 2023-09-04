_npmname=semantic-release-cli
pkgname=nodejs-$_npmname
pkgver=5.4.4 # renovate: datasource=github-tags depName=semantic-release/cli
pkgrel=1
pkgdesc="setup automated semver compliant package publishing"
arch=(any)
url="https://github.com/semantic-release/cli"
license=('MIT')
depends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('4dfac2e982101eee36e8cfb9ba0f6ca5d38c2d7a4e4b5734c5f68a1679b8fdb7')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  chmod -R go-w "$pkgdir"/usr
}

