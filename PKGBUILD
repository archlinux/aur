# Maintainer: Peter Donka <peter.donka@gmail.com>
pkgname=kube-ps1
pkgver=0.9.0
pkgrel=2
pkgdesc="A script that lets you add the current Kubernetes context and namespace configured on kubectl to your Bash/Zsh prompt"
arch=('any')
url="https://github.com/jonmosco/kube-ps1"
license=('APACHE')
depends=('grep' 'kubectl')
source=(
$pkgname.tar.gz::https://github.com/jonmosco/kube-ps1/archive/v${pkgver}.tar.gz
)
md5sums=('441cc43fa130b71ec41258ae310e414b')

install="${pkgname}.pacman"

package() {
	KUBE_PS1_PATH="$pkgdir/opt/$pkgname"

	mkdir -p "$KUBE_PS1_PATH"
	cp -rf "$pkgname-$pkgver"/* "$KUBE_PS1_PATH"
	chmod a+r "${KUBE_PS1_PATH}/kube-ps1.sh"
}
