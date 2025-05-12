_npmname=@zohocrm/zdk-cli
_npmver=1.0.3-beta
pkgname=zdk-cli
pkgver=1.0.3_beta
pkgrel=1
pkgdesc="ZDK CLI (Zoho Development Kit CLI) is a set of CLI tools that you can use to interact with and manage your CRM org metadata in a developer-friendly way."
arch=(any)
url="https://www.zoho.com/crm/developer/docs/zdk-cli/quick-start.html"
license=(Apache-2.0)
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/$_npmname/-/$pkgname-$_npmver.tgz")
noextract=("$pkgname-$_npmver.tgz")
sha1sums=(b61d78dcdf96d642ed6e32b6774ff98f50f08d1a)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" "$_npmname@$_npmver"
  chown -R root:root "$pkgdir"
}

# vim:set ts=2 sw=2 et:
