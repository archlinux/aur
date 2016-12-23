_name='zsh-notify'
pkgname="${_name}-git"
pkgver=29.cf8c1b9
pkgrel=1
pkgdesc="Desktop notifications for long-running commands in zsh."
url="https://github.com/marzocchi/zsh-notify"
arch=('any')
license=('MIT')
depends=('zsh')
makedepends=('git')
provides=('zsh-notify')
source=("${_name}::${url//https/git}")
sha256sums=('SKIP')

pkgver() {
   cd "${srcdir}/${_name}"
   echo "$(git rev-list --count HEAD).$(git describe --always )"
}

package() {
    cd "${srcdir}/${_name}"
    install -d "${pkgdir}/usr/share/zsh/plugins/${_name}"
    cp -a --no-preserve=ownership * "${pkgdir}/usr/share/zsh/plugins/${_name}"
}
