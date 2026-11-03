# Maintainer: Koen Hendriks <info@koenhendriks.nl>

pkgname=claude-sessions-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Fuzzy finder for every Claude Code session on this machine, continues the one you pick (prebuilt static binary)"
arch=('x86_64')
url="https://github.com/koenhendriks/claude-sessions"
license=('MIT')
provides=('claude-sessions')
conflicts=('claude-sessions')
options=('!debug')
optdepends=('claude-code: the Claude Code CLI that sessions are opened with')
_src="claude-sessions-$pkgver-x86_64-linux"
source=("$url/releases/download/v$pkgver/$_src.tar.gz")
sha256sums=('85e39783bc4d195ceb5484038fff1d5cfee42860704305bdd2c2e80c8e2c8e7d')

package() {
	cd "$_src"
	# tools/aur-pkgbuild.sh --bin points this at the binary in the release's binary tarball.
	local bin="claude-sessions"
	install -Dm755 "$bin" "$pkgdir/usr/bin/claude-sessions"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/claude-sessions/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/claude-sessions/README.md"
}
