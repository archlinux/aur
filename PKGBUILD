# Maintainer: Stijn Seghers <stijnseghers at gmail dot com>

pkgname=python-pylint-venv
_internal_pkgname=pylint-venv
_commit='584fe9bb6252c448d4dfe868489121616f24fb97'
pkgver=1.1.0
pkgrel=1
pkgdesc='Make pylint respect virtualenvs.'
arch=('any')
url="https://github.com/jgosmann/${_internal_pkgname}"
license=('MIT')
optdepends=('python-pylint: Kind of useless without it'
            'python-virtualenv: Kind of useless without it')
source=("https://files.pythonhosted.org/packages/60/28/805d3a28822f757e87f9b501481cb74ea60a090ff7c6dd585dca8a63301f/${_internal_pkgname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/jgosmann/${_internal_pkgname}/${_commit}/LICENSE.txt")
md5sums=('dc3558d2bab86b2b6f800e8eb3d842fd'
         'e54892570ca5eec95aeb1d0462848952')

package() {
  cd "${srcdir}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "${srcdir}/${_internal_pkgname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}" --optimize=1
}
