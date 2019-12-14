# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Jeremy Asuncion <jeremyasuncion808@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=lab-bin
pkgver=0.17.1
pkgrel=1
pkgdesc="A hub-like tool for GitLab (pre-built binary release)"
arch=('x86_64')
url="https://zaquestion.github.io/lab/"
license=('custom:Unlicense')
depends=('git')
optdepends=('hub')
makedepends=('go')
conflicts=("${pkgname%-bin}-git" "${pkgname%-bin}")
source=("https://github.com/zaquestion/${pkgname%-bin}/releases/download/v$pkgver/lab_${pkgver}_linux_amd64.tar.gz")
sha512sums=('15e1018e733df2ed31c17144b0ffe1adc65742783ce636140a64e685919371300cd54912e0fc11b4a6235ebe9d740b7bdb866688e322f3eda62c7eb3cbf68df6')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-bin}"/LICENSE
    install -Dm755 lab "$pkgdir"/usr/bin/lab
}
