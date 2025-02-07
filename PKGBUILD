# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="6.101-submit"
pkgver=S25_000
pkgrel=1
pkgdesc="CLI tool for submitting code assignments in MIT's 6.101 Introduction to Programming course"
arch=('any')
url="https://py.mit.edu/spring25/info/infrastructure/gnu_linux"
license=('custom:Unknown')
depends=('bash' 'openssh' 'python>=3.13.1' 'python-pytest')
optdepends=('python-black'
            'python-pylint')
source=("${pkgname}.sh::https://py.mit.edu/_static/spring25/${pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}"
  sed -n 's/^version="\(.*\)"/\1/p' "${pkgname}.sh" | sed 's/-/_/g'
}

package() {
  cd "${srcdir}"
  install -vDm755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
