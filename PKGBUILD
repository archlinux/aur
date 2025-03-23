# Maintainer: VCalV

_pkgname=keybase-completion
_gituser=jhazelwo
pkgname=keybase-bash-completion
pkgdesc="Bash completion for keybase CLI"
pkgver=1.2.2
pkgrel=1
arch=("any")
url="https://github.com/${_gituser}/${_pkgname}"
conflicts=(keybase-bash-completion-git)
provides=(keybase-bash-completion)
license=("MIT")
makedepends=('git')
depends=("bash-completion" "keybase")
source=("$pkgname-$pkgver.tar.gz::https://github.com/${_gituser}/${_pkgname}/archive/refs/tags/version_${pkgver}.tar.gz")
sha512sums=('29fbfa97d24f55bae52a7af39c5cb6138ec1c0644ed908708aeef6ebc701f1366eb82c29a054c6611741308a28ed2997ab0ec765e830c72264d4027fb98a817d')

package() {
	cd "${_pkgname}-version_${pkgver}"
	install -Dm644 keybase.sh "$pkgdir/usr/share/bash-completion/completions/keybase"

  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
