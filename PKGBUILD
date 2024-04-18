# Contributor: AsukaMinato
# Maintainer: tee < teeaur at duck dot com >
pkgname=gojq-bin
pkgver=0.12.15
pkgrel=1
pkgdesc="Pure Go implementation of jq"
arch=(x86_64 aarch64)
url="https://github.com/itchyny/gojq"
license=('MIT')
provides=(gojq)
conflicts=(gojq)
source_x86_64=($url/releases/download/v$pkgver/gojq_v${pkgver}_linux_amd64.tar.gz)
source_aarch64=($url/releases/download/v$pkgver/gojq_v${pkgver}_linux_arm64.tar.gz)
sha256sums_x86_64=('ed105868b6bbb40b721fae9d7ebe18b14551e8f30b3edd6cb7e79fa5088b5604')
sha256sums_aarch64=('786c4ad77c89330db15841d7ba7d04cf7fdeaaf5fa2b0a059e14053a53c4cf99')

package() {
	for f in *;
	do
		if [ -d "$f" ];
		then
			pushd "$f";
			install -Dm644 LICENSE -t $pkgdir/usr/share/licenses/$pkgname/
			install -Dm755 gojq -t $pkgdir/usr/bin
			install -Dm644 _gojq -t $pkgdir/usr/share/zsh/site-functions/ # zsh comp https://unix.stackexchange.com/questions/607809/
			install -Dm644 CREDITS CHANG* READ* -t $pkgdir/usr/share/doc/$pkgname/

		fi
	done
}

# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
