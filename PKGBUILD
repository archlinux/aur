# Maintainer: Bart Libert <bart plus aur at libert dot email>
_pkgname=zsh-sudo
_commit=f8bf8f0029a475831ebfba0799975ede20e08742
pkgname=zsh-sudo
pkgver=${_commit:0:7}
pkgrel=1
pkgdesc="Easily prefix your current or previous commands with sudo by pressing esc twice"
arch=(any)
url="https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo"
license=("MIT")
depends=("zsh")
makedepends=("git")
source=(git+https://github.com/ohmyzsh/ohmyzsh.git#commit=$_commit)
conflicts=('zsh-sudo-git')
sha256sums=('97e5e3454dca543562b6f5672681892d4f2ebf85a9b1737121acbba46b2088ac')

package() {
  install -d "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
  install -Dm644 "${srcdir}/ohmyzsh/plugins/sudo/sudo.plugin.zsh" \
        "${pkgdir}/usr/share/zsh/plugins/${_pkgname}"
  install -Dm644 "${srcdir}/ohmyzsh/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
