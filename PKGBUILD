# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=oh-my-zsh-plugin-autosuggestions
_pkgname=zsh-autosuggestions
pkgver=0.7.0
pkgrel=1
pkgdesc="Fish-like autosuggestions for oh-my-zsh "
arch=('any')
url="https://github.com/zsh-users/zsh-autosuggestions"
license=('MIT')
depends=('zsh' 'oh-my-zsh-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zsh-users/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('b1a0a11a89095e4f142061525f92836588561e3bfab015bb96eabe3f1f68d0cfcd7483014dac8c5b2911e65640e9182c5fc4cb4fb53e3a05ef7997c006ff76a6')
b2sums=('b12c387a7a6424f1e3e2bc76a4d9f11a3bddb4bc1d69236249722a829c53f3136ff0cbf8aaf02faff54f49f7b7363fcd06576a2dc6c8026c62951da2d0ebc2c2')

build() {
  cd "$_pkgname-$pkgver"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  install -vDm 644 ${_pkgname}{,.plugin}.zsh \
    -t "${pkgdir}/usr/share/oh-my-zsh/custom/plugins/${_pkgname}/"
  # docs
  install -vDm 644 {CHANGELOG,README}.md \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
  # license
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

