# Maintainer: Daniel Moch <daniel@danielmoch.com>
pkgname=python-hookmeup
_name=${pkgname#python-}
pkgver=0.2.0
pkgrel=1
pkgdesc='A Git hook to automate your Pipenv and Django workflow'
provides=('python-hookmeup')
conflicts=('python-hookmeup')
arch=('any')
url='https://github.com/djmoch/hookmeup'
license=('MIT')
depends=('python')
makedepends=('python-pip')
source=("${_name}-${pkgver}-py3-none-any.whl::https://files.pythonhosted.org/packages/py3/${_name::1}/${_name}/${_name}-${pkgver}-py3-none-any.whl"
        "https://raw.githubusercontent.com/djmoch/hookmeup/master/LICENSE")
sha256sums=('d74becee145c0ad2d862f06cc74926382065f65616c51a52c60f29abfbb4c5d5'
            '04ce4be582df887dfa8ad52cf5cacf543a5e0e49dce9be518114fc676c409a09')
noextract=("${pkgname}-${pkgver}-py3-none-any.whl")

package()
{
  cd "${srcdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  pip install -I --no-warn-script-location --isolated --no-deps --compile --root="${pkgdir}" ${_name}-${pkgver}-py3-none-any.whl
}

# vim: ft=PKGBUILD sts=2 sw=2 et
