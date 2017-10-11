# Maintainer : Lilian Deloche <lilian.deloche@puck.fr>

_npmname=generator-ansible
_npmver=0.0.5
pkgname=nodejs-generator-ansible
pkgver=0.0.5
pkgrel=1
pkgdesc="Yeoman generator for ansible"
arch=(any)
url="https://github.com/zshannon/generator-ansible/"
license=(MIT)
depends=('nodejs-yeoman')
optdepends=()
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$_npmver.tgz)
noextract=($_npmname-$_npmver.tgz)
sha256sums=(e42420dc1e7fc57c8735a92bd2105e0e8c020085d4f32c8727e3a799e3842ca8)

package() {
  cd "$srcdir"
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p "$_npmdir"
  cd "$_npmdir"
  npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
  rm -rf "$pkgdir"/usr/bin
  rm -rf "$pkgdir"/usr/lib/node_modules/{grunt-cli,bower,yo,generator-karma}
}

