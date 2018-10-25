# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=trellowarrior
pkgver=0.2.0
pkgrel=1
pkgdesc='Tool to sync Taskwarrior projects with Trello boards'
arch=('any')
url='https://github.com/ogarcia/trellowarrior'
license=('MIT')
depends=('python-tasklib' 'python-py-trello')
makedepends=('python-setuptools')
source=("https://github.com/ogarcia/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('c5b7a94f63a4357acb93423d8511cb1944113aebe2ec91fedd65a96f20951afd')

package() {
  cd "${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize='1'

  # config file
  install -D -m644 "${pkgname}.conf" \
    "${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.sample.conf"

  # doc file
  install -D -m644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
