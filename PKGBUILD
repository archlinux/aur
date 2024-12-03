# Contributor: AsukaMinato
# Maintainer: tee < teeaur at duck dot com >
pkgname=gojq-bin
pkgver=0.12.17
pkgrel=1
pkgdesc="Pure Go implementation of jq"
arch=(x86_64 aarch64)
url="https://github.com/itchyny/gojq"
license=('MIT')
provides=(gojq)
conflicts=(gojq)
source_x86_64=($url/releases/download/v$pkgver/gojq_v${pkgver}_linux_amd64.tar.gz)
source_aarch64=($url/releases/download/v$pkgver/gojq_v${pkgver}_linux_arm64.tar.gz)
sha256sums_x86_64=('cd876631b9b3368dd98ad1ccb361474387de03e0925ea26d73539dd054aa39cb')
sha256sums_aarch64=('12e9de5dd1c8665f67afe17bc93f433554c38eb50cd66ce945aea1e9e98c7ed4')

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
