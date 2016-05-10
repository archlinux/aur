# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=sshrc
pkgver=0.6.1
pkgrel=1
pkgdesc="Bring your .bashrc, .vimrc, etc. from your local workstation when you ssh into a remote box."
arch=('any')
url="https://github.com/Russell91/sshrc"
license=('MIT')
depends=('openssh')
makedepends=('git')
source=("https://github.com/Russell91/sshrc/archive/${pkgver}.zip")
md5sums=('8a72d40d23d4550a11274c680c5f1838')
conflicts=(sshrc-git)

package() {
  cd "${srcdir?}/$pkgname-$pkgver" || return 1
  install -Dm 0755 sshrc "${pkgdir?}/usr/bin/sshrc"
  install -Dm 0755 moshrc "${pkgdir?}/usr/bin/moshrc"
  install -Dm 0644 LICENSE "${pkgdir?}/usr/share/licenses/$pkgname/LICENSE"
}
