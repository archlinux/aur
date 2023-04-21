# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=gojq-bin
pkgver=0.12.12
pkgrel=1
epoch=
pkgdesc="Pure Go implementation of jq"
arch=(x86_64 aarch64)
url="https://github.com/itchyny/gojq"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(gojq)
conflicts=(gojq)
replaces=()
backup=()
options=()
install=
changelog=
source_x86_64=(https://github.com/itchyny/gojq/releases/download/v$pkgver/gojq_v${pkgver}_linux_amd64.tar.gz)
source_aarch64=(https://github.com/itchyny/gojq/releases/download/v$pkgver/gojq_v${pkgver}_linux_arm64.tar.gz)
noextract=()
sha256sums_x86_64=('f6f20b04dfa55b9588950f8561b5356ed018f10e0056ceabbe6159b5e435396e')
sha256sums_aarch64=('c343d3858143883995a6caed2ec1e5b6c8b8e02fd89510bbac0ebbae4fd06225')

validpgpkeys=()

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
