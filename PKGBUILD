# Maintainer: somini <dev@somini.xyz>
pkgname=git-identity
_pkgver=1.1.1
pkgver=v${_pkgver}
pkgrel=2
pkgdesc="Manage your identity in Git"
arch=('any')
url="https://github.com/madx/git-identity"
license=('custom:WTFPL')
depends=('git')
makedepends=('bash-completion')
# checkdepends=()
optdepends=('zsh: for zsh completion')
provides=('git-identity')
conflicts=('git-identity')
source=("https://github.com/madx/git-identity/archive/$pkgver.tar.gz")
sha1sums=('64b5cd07a1702597bf80436ef1e8d95a6583b2fb')

package() {
	cd "$srcdir/${pkgname}-${_pkgver}"
	install -D git-identity -t "$pkgdir/usr/bin"

	# License
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# Completions
	install -Dm644 git-identity.bash-completion "$pkgdir$(pkg-config --variable=completionsdir bash-completion)/git-identity"
	install -Dm644 git-identity.zsh-completion "$pkgdir/usr/share/zsh/site-functions/_git-identity"
}
