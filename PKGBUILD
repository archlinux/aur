# Maintainer: gryffyn <aur@evan.mp>

pkgname=python-pytelegrambotapi-git
_pkgname=pyTelegramBotAPI
pkgver=r2434.e10517e
pkgrel=1
pkgdesc="Python Telegram bot api - git"
arch=('any')
url="https://github.com/eternnoir/pyTelegramBotAPI"
license=("GPL3")
conflicts=('python-pytelegrambotapi')
depends=('python' 'python-requests')
makedepends=('git')
provides=('python-pytelegrambotapi')
source=("${_pkgname}"::"git+https://github.com/eternnoir/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${_pkgname}
    python setup.py install --root ${pkgdir}
}
