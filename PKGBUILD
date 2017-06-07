_npmname=semantic-release-cli
pkgname=nodejs-$_npmname
pkgver=3.0.3
pkgrel=1
pkgdesc="setup automated semver compliant package publishing"
arch=(any)
url="https://github.com/semantic-release/cli"
license=('MIT')
depends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('f1490fec7493ec583f04205226168a56677114bac7b096d8c5cc3ea1a23fcc19')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  chmod -R go-w "$pkgdir"/usr
}
