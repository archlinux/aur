# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=navita
pkgver=2.3.12
pkgrel=1
pkgdesc="Fast directory navigation for Bash/Zsh with fuzzy search over history"
arch=('any')
url="https://github.com/CodesOfRishi/navita"
license=('Apache-2.0')
depends=('bash' 'fzf' 'grep' 'bc' 'findutils' 'util-linux' 'coreutils')
optdepends=('zsh: para usarlo también en zsh' 'less: para ver el historial en un paginador')
install=$pkgname.install
_tag="v2.3.12"
_srcdir="navita-2.3.12"
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/CodesOfRishi/navita/tar.gz/refs/tags/$_tag")
sha256sums=('2a69747035b6584500a7b9d9a75ca6ecb9b5a3aabdcf3860628d5313aa8c0401')

package() {
	cd "$_srcdir"
	install -Dm644 navita.sh "$pkgdir/usr/share/$pkgname/navita.sh"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -d "$pkgdir/usr/share/$pkgname/test"
	install -Dm755 test/test_CDGeneral "$pkgdir/usr/share/$pkgname/test/test_CDGeneral"
	install -Dm755 test/test_NavigateChildDirs "$pkgdir/usr/share/$pkgname/test/test_NavigateChildDirs"
	install -Dm755 test/test_NavigateHistory "$pkgdir/usr/share/$pkgname/test/test_NavigateHistory"
	install -Dm755 test/test_RemoveInvalidPaths "$pkgdir/usr/share/$pkgname/test/test_RemoveInvalidPaths"
	install -Dm755 test/test_ToggleLastVisits "$pkgdir/usr/share/$pkgname/test/test_ToggleLastVisits"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
