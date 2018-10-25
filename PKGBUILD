# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Jeremy Asuncion <jeremyasuncion808@gmail.com>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=lab-bin
pkgver=0.14.0
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
sha512sums=('736e1dc6326de589feed82a0fe0c7354945d277440629cccd43f798f9b3b7e7d93747d64908e219e178ecd73fcd58aadf145886c057e9404123b4210491e9fd1')

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-bin}"/LICENSE
    install -Dm755 lab "$pkgdir"/usr/bin/lab
}
