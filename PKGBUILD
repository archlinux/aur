# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=sshrc
pkgver=0.6.2
pkgrel=2
pkgdesc="Bring your .bashrc, .vimrc, etc. from your local workstation when you ssh into a remote box."
arch=('any')
url="https://github.com/cdown/sshrc"
license=('MIT')
depends=('openssh')
makedepends=('git')
source=("https://github.com/cdown/sshrc/archive/${pkgver}.zip")
md5sums=('b3bba68b8cb88c9df882040f839583fd')
conflicts=(sshrc-git)

package() {
  cd "${srcdir?}/$pkgname-$pkgver" || return 1
  install -Dm 0755 sshrc "${pkgdir?}/usr/bin/sshrc"
  install -Dm 0755 moshrc "${pkgdir?}/usr/bin/moshrc"
  install -Dm 0644 LICENSE "${pkgdir?}/usr/share/licenses/$pkgname/LICENSE"
}
