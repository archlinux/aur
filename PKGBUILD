# Maintainer: Daniel Moch <daniel@danielmoch.com>
pkgname=nncli
pkgver=0.2.0
pkgrel=1
pkgdesc="NextCloud Notes Command Line Interface"
arch=('any')
url="https://github.com/djmoch/${pkgname}"
license=('MIT')
depends=('python' 'python-urwid' 'python-requests' 'python-appdirs')
makedepends=('python-pip')
source=("${pkgname}-${pkgver}-py3-none-any.whl::https://files.pythonhosted.org/packages/py3/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}-py3-none-any.whl"
        "LICENSE::https://raw.githubusercontent.com/djmoch/${pkgname}/v${pkgver}/LICENSE")
sha256sums=('e8f07c22f1d8870e23e76c082a113eea2d0bc3e003525c25ac2e0bba1688606a'
            '5240402e10b059c75958f58a489e92eaf994c7274f0b8d566f95bb35dda62383')
noextract=("${pkgname}-${pkgver}-py3-none-any.whl")

package()
{
  cd "${srcdir}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  pip install -I --no-warn-script-location --isolated --no-deps --compile --root="${pkgdir}" ${pkgname}-${pkgver}-py3-none-any.whl
}


# vim: ft=PKGBUILD ts=2 sw=2 et
