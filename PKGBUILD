# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=container-transform
pkgver=1.1.5
pkgrel=1
pkgdesc='Small utility to transform various docker container formats to one another'
arch=('any')
url='https://github.com/micahhausler/container-transform'
license=('MIT')
depends=('python-click' 'python-jinja' 'python-yaml')
makedepends=('python-setuptools')
source=("https://github.com/micahhausler/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('2063ac32c802929eb7ef5be9f6934f37f584148ed186deb9b9d276dd6cc21112')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize='1'
  # doc files
  install -D -m644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -D -m644 CONTRIBUTORS.txt \
    "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTORS.txt"
}
