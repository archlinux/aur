# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=fish-prompt-nai-dusan-git
_reponame=theme-nai
pkgver=r8.0319c8e
pkgrel=1
pkgdesc="A minimalist fish theme which displays git branch and status information"
arch=(any)
url=https://github.com/dusansimic/theme-nai
license=(MIT)
groups=(fish-plugins)
depends=('fish>=3')
provides=(fish-prompt)
conflicts=(fish-prompt)
source=("git+$url.git")
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/$_reponame"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_reponame"
	install -Dm644 "functions/fish_prompt.fish" -t "$pkgdir/etc/fish/functions"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"
}
