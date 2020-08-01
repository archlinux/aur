# Maintainer: Soraxas <oscar AT tinyiu DOT com>

_name=shsh
pkgname=shsh
pkgver=2.4.2
pkgrel=1
pkgdesc="Bring your favorite shell wherever you go through the ssh"
arch=('any')
url="https://github.com/soraxas/shsh"
license=('MIT')
depends=()
provides=('shsh')
conflicts=('shsh')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" "shsh-entrypoint.sh")
sha256sums=('13c2174d0847629143f48e4d4b5cab046b11217dc925be853720e79f0649877b' '23826816377fc14a0c9d7eb9d326ccfa0d887bb753e900939f2d7990380dba3a')


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

