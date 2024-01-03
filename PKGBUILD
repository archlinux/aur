#Maintainer: Dmytro Aleksandrov <alkersan@gmail.com>
pkgname=kickstart-git
pkgver=r144.fe17004
pkgrel=1
pkgdesc="Bash only provisioning tool"
depends=('bash' 'which')
makedepends=('git' 'which')
arch=('any')
url="https://github.com/bltavares/kickstart"
license=('unknown')
conflicts=( )
options=( )
source=("${pkgname%-git}::git+https://github.com/bltavares/kickstart.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/kickstart"
  
  cp -r "${pkgname%-git}" "${pkgdir}/usr/share"
  ln -s -f "/usr/share/kickstart/bin/kickstart" "$pkgdir/usr/bin/kickstart"
}
