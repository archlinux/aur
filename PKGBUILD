# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-alpheon-git
_pkgname=alpheon
pkgver=r5.919d783
pkgrel=1
pkgdesc="Remembers why your project is the way it is: drafts a reviewable HANDOFF.md from your git diff"
arch=('any')
url="https://github.com/BravoAlphaSix/alpheon"
license=('MIT')
depends=('python' 'git')
makedepends=('git')
provides=("python-alpheon")
conflicts=("python-alpheon")
source=("$_pkgname::git+$url.git#branch=master")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "$_pkgname"
	install -Dm755 "$_pkgname.py" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 examples/HANDOFF.md "$pkgdir/usr/share/doc/$_pkgname/HANDOFF.example.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
