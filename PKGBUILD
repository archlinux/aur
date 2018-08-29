# Maintainer: Daniel Moch <daniel@danielmoch.com>
pkgname=python-hookmeup
_name=${pkgname#python-}
pkgver=0.1.1
pkgrel=1
pkgdesc='A Git hook to automate your Pipenv and Django workflow'
provides=('python-hookmeup')
conflicts=('python-hookmeup')
arch=('any')
url='https://github.com/djmoch/hookmeup'
license=('MIT')
depends=('python>=3.5')
makedepends=('python-pip')
source=("${_name}-${pkgver}-py3-none-any.whl::https://files.pythonhosted.org/packages/py3/${_name::1}/${_name}/${_name}-${pkgver}-py3-none-any.whl"
        "https://raw.githubusercontent.com/djmoch/hookmeup/master/LICENSE")
sha256sums=('809860ca3e1f1aaea788fcb5d9a26096a042f94c21d15489dc9221c8ec48fdc3'
            '04ce4be582df887dfa8ad52cf5cacf543a5e0e49dce9be518114fc676c409a09')
noextract=("${pkgname}-${pkgver}-py3-none-any.whl")

package()
{
  cd "${srcdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  pip install -I --no-warn-script-location --isolated --no-deps --compile --root="${pkgdir}" ${_name}-${pkgver}-py3-none-any.whl
}

# vim: ft=PKGBUILD sts=2 sw=2 et
