# Maintainer: Brad Erhart <brae.04+aur@gmail.com>

pkgname=eksctl-bin
_pkgname=${pkgname%-bin}
pkgver=0.25.0
pkgrel=1
pkgdesc="A simple CLI tool for creating clusters on Amazon's EKS"
arch=(x86_64)
url='https://eksctl.io'
license=(Apache)
depends=(kubectl)
conflicts=($_pkgname)
source=("https://github.com/weaveworks/eksctl/releases/download/$pkgver/${_pkgname}_Linux_amd64.tar.gz")
sha256sums=(e94e4ec335c036d8f511ea214d5a55dfd097e2053747d7d04d6db49fff107531)

package() {
	install -Dm 755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" completion bash | install -Dm 644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
	"$pkgdir/usr/bin/$_pkgname" completion zsh | install -Dm 644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
}
