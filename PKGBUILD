# Maintainer: Arunachalam | Tamil Nadu-based Arch Linux Software Builder <your_email@example.com>
# Contributor: Arunachalam <your_email@example.com>

pkgname=cyberkit-git
pkgver=1.0.r0.g0000000
pkgrel=1
pkgdesc="All-in-One Cybersecurity Toolkit by Arunachalam - 22 Tools in One Script (Tamil Nadu)"
arch=('any')
url="https://github.com/Arunachalam-gojosaturo/cyberkit"
license=('MIT')
depends=('bash' 'curl' 'git')
makedepends=('git')
provides=('cyberkit')
conflicts=('cyberkit')
source=("${pkgname}::git+https://github.com/Arunachalam-gojosaturo/cyberkit.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 cyberkit.sh "${pkgdir}/usr/bin/cyberkit"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
