# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

_npmname=agentdash
pkgname=agent-dash
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI for connecting agents to an Agent Dash notification hub"
arch=('any')
url="https://github.com/Prajeevan/agent-dash"
license=('MIT')
depends=('nodejs>=18')
makedepends=('npm')
provides=('agentdash')
conflicts=('agentdash')
options=('!strip' '!debug')
source=("$_npmname-$pkgver.tgz::https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz"
        "LICENSE::https://raw.githubusercontent.com/Prajeevan/agent-dash/96dc7be88cacc24c1080a1d108984b01a61bbf4f/LICENSE")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('62529e7e734beaca8779b8d6a21494ab285864ea0557ff2c84a9c7356d3de717'
            '2e80ae0a4112e218e6c3caec1f63b316f7b02385952040b576bcabe1fbc01c6e')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"

  # npm can create directories with nondeterministic permissions.
  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
