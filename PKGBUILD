# Maintainer: atomicfs <https://aur.archlinux.org/account/atomicfs>

pkgname=robotframework-lint
pkgver=1.1.0
pkgrel=1
pkgdesc="Linter for robot framework plain text files"
arch=('any')
url="https://github.com/boakley/robotframework-lint"
license=('Apache-2.0')
depends=('python')
source=("${pkgname}::git+${url}#commit=b0619ac58a8b1be125f9c98856a664594614570f")
sha512sums=('84eb1c90ac3eb2935588c0fed90ddfb3b4f3c776aefcbe7f701c17e96298d7f7df976cabf214f8e661868dd98858eab69232ce89626ce1f24c0447111e97f789')

build() {
  cd "${srcdir}/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
