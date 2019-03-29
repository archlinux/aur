# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Jeremy Asuncion <jeremyasuncion808@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=lab-bin
pkgver=0.15.3
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
sha512sums=('5a96493e7c3dd1466d3bf0d8a2b7fb6a4c3e3e3597fbfda2b6e704ae7edc5aa1fa9c319f2f23cb054235c5128ecb84dc2e3ad7e6b0d9f11a14af9dc4ed583fbf')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-bin}"/LICENSE
    install -Dm755 lab "$pkgdir"/usr/bin/lab
}
