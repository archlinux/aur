# Maintainer: Soraxas <oscar AT tinyiu DOT com>

_name=shsh
pkgname=shsh
pkgver=3.0.2
pkgrel=1
pkgdesc="A multi-threaded manager for shell scripts, functions, binaries, completions files."
arch=('any')
url="https://github.com/soraxas/shsh"
license=('MIT')
depends=()
provides=('shsh')
conflicts=('shsh')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" "shsh-entrypoint.sh")
sha256sums=('e1947fa097b63dfdebd79cecf157e2aba93744293dd1624738ac50f5bdb26a8d'
            '23826816377fc14a0c9d7eb9d326ccfa0d887bb753e900939f2d7990380dba3a')


package() {
  cd $srcdir/$_name-$pkgver

  install -dm755 "$pkgdir"/{usr/bin,usr/lib/shsh,usr/share/man/man1,usr/share/licenses/$_name}
  install -D -m 755 libexec/* "$pkgdir/usr/lib/shsh"
  install -D -m 755 "$srcdir/shsh-entrypoint.sh" "$pkgdir/usr/bin/shsh"
  install -D -m 644 man/man1/* "$pkgdir/usr/share/man/man1"
	install -D -m 644 completions/shsh.bash "${pkgdir}/usr/share/bash-completion/completions/shsh"
	install -D -m 644 completions/shsh.zsh "${pkgdir}/usr/share/zsh/site-functions/_shsh"
	install -D -m 644 completions/shsh.fish "${pkgdir}/usr/share/fish/completions/shsh.fish"
  install -D -m 644 LICENSE "$pkgdir"/usr/share/licenses/$_name/LICENSE
}

