# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=trellowarrior
pkgver=1.1.0
pkgrel=1
pkgdesc='Tool to sync Taskwarrior projects with Trello boards'
arch=('any')
url='https://github.com/ogarcia/trellowarrior'
license=('GPL')
depends=('python-tasklib' 'python-py-trello')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('60011764950c5f464f0ffe3798aad25d899fa1dff584acd4f5a271db43faa352')

package() {
  cd "${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize='1'

  # config file
  install -D -m644 "${pkgname}.conf" \
    "${pkgdir}/usr/share/doc/${pkgname}/${pkgname}.sample.conf"

  # doc and contributing file
  install -D -m644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -D -m644 CONTRIBUTING.md \
    "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
}
