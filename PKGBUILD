# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=Columnar
pkgname="python-${_pkgname,,}"
pkgver=1.3.1
pkgrel=1
pkgdesc="A tool for printing data in a columnar format."
arch=('any')
url="https://pypi.org/project/${_pkgname}"
license=('MIT')
depends=('python' 'python-toolz' 'python-wcwidth')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname/-/_}/${_pkgname/-/_}-${pkgver}.tar.gz"
        LICENSE.txt)
sha256sums=('3fda53a5c8858e5103a647bd23dc9ad11ed107888a409aeca1f3a89327abd0db'
            'ed50ff698e505a4e5c3d3423f64d11f1f9a32cb42ca08fb8a458c88d0e678774')
b2sums=('fb1f325e22538e806c1348ff2c60605e21fe812bc90f9d798931853786a569ae09e91c47d4a33ca79ab5f39514576efbb98446bde8d4c37b76e1444e1690729a'
        '96cb8f2de0daa0567e5ceb291ec2f6b44dd4c4407f20c4f7567f1c902080cb0d45b82bcee7224aada1d51c75039f9b46ba9e530ccb96fcdb3b2af5e5ec0e63b9')

build() {
  cd "${_pkgname/-/_}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pkgname/-/_}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
