#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>
pkgname=kickstart-git
pkgver=r133.8d4b516
pkgrel=1
pkgdesc="Bash only provisioning tool"
depends=('bash')
arch=('any')
url="https://github.com/bltavares/kickstart"
license=('unknown')
conflicts=( )
options=( )
source=("git+https://github.com/bltavares/kickstart.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  make PREFIX="${pkgdir}/usr" install
  ln -s -f "/usr/share/kickstart/bin/kickstart" "${pkgdir}/usr/bin/kickstart"
}
