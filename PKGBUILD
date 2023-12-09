_npmname=semantic-release-cli
pkgname=nodejs-$_npmname
pkgver=5.4.5 # renovate: datasource=github-tags depName=semantic-release/cli
pkgrel=1
pkgdesc="setup automated semver compliant package publishing"
arch=(any)
url="https://github.com/semantic-release/cli"
license=('MIT')
depends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('ede8c4cd14fe750cb373a40a9d48dcc2ee74ee00c5854914aca09ef5c7b91284')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  chmod -R go-w "$pkgdir"/usr
}

