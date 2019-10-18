# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Jason Papakostas <vithos@gmail.com>
# Contributor: Liganic <liganic-aur@gmx.net>
_pkgname='cpplint'
pkgname=${_pkgname}-py3
pkgver='1.4.4'
pkgrel=1
pkgdesc="Command-line tool to check C/C++ files for style issues following Google's C++ style guide."
arch=('any')
url='https://github.com/cpplint/cpplint'
license=('custom:BSD3')
depends=('python')
provides=('cpplint' 'python-cpplint')
conflicts=('cpplint')
checkdepends=('python-pytest' 'python-pytest-cov')
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('77a0f3c2469a737e899443ef2d29f498')
sha1sums=('9ca2b8fc3992130a62f4dc3708a67b10eb1baec7')
sha256sums=('05f879aab5a04307e916e32afb547567d8a44149ddc2f91bf846ce2650ce6d7d')
sha512sums=('27b1802c857432d1c6eae1fd76d06b60eaa3b57060546b1cfd4a4b6881a3f8fb696f86f303d20b436d6123bf1c26b4dcadd0b1032f70dc6a581c230ab6015017')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py test
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  install -Dm755 "cpplint.py" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
