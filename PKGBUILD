# Contributor: AsukaMinato
# Maintainer: tee < teeaur at duck dot com >
pkgname=gojq-bin
pkgver=0.12.18
pkgrel=1
pkgdesc="Pure Go implementation of jq"
arch=(x86_64 aarch64)
url="https://github.com/itchyny/gojq"
license=('MIT')
provides=(gojq)
conflicts=(gojq)
source_x86_64=($url/releases/download/v$pkgver/gojq_v${pkgver}_linux_amd64.tar.gz)
source_aarch64=($url/releases/download/v$pkgver/gojq_v${pkgver}_linux_arm64.tar.gz)
sha256sums_x86_64=('7f00d3e5336749139199e650bcad89b93341b871f211a34e02fca79e59d5eb45')
sha256sums_aarch64=('519601a973cc74621d0ee775a86cac791f45bb69a78bd1901aadd46701b4c571')

package() {
	for f in *;
	do
		if [ -d "$f" ];
		then
			pushd "$f";
			install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
			install -Dm755 gojq -t "$pkgdir/usr/bin"
			install -Dm644 _gojq -t "$pkgdir/usr/share/zsh/site-functions/" # zsh comp https://unix.stackexchange.com/questions/607809/
			install -Dm644 CREDITS CHANG* READ* -t "$pkgdir/usr/share/doc/$pkgname/"

		fi
	done
}

# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
