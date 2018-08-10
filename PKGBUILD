# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Jeremy Asuncion <jeremyasuncion808@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=lab-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="A hub-like tool for GitLab (pre-built binary release)"
arch=('x86_64')
url="https://zaquestion.github.io/lab/"
license=('custom:Unlicense')
depends=('git')
optdepends=('hub')
makedepends=('go')
conflicts=("${pkgname%-bin}-git" "${pkgname%-bin}")
source=("https://github.com/zaquestion/${pkgname%-bin}/releases/download/v${pkgver}/lab_${pkgver}_linux_amd64.tar.gz")
sha512sums=('e442c47cb60405e8b7f4d9cf0a1cc8092ba4ab9fe93e9598494f171a659efa61e061dc4ef8e0ff55867b602e803a45931729b229a535f9a0a99cd3c769275a13')

package() {
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE
    install -Dm755 lab $pkgdir/usr/bin/lab
}
