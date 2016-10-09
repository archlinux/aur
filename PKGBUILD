# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>

pkgname=python-imapnotify
pkgver=0.0.3
pkgrel=1
pkgdesc='Execute scripts on new messages using IDLE imap command (python version)'
arch=('any')
url='https://github.com/a-sk/python-imapnotify'
license=('custom')
depends=('python>=3.5' 'python-pytest-runner>=2.0' 'python-pytest-runner<3' 'python-aioimaplib>=0.5.14' 'python-aioimaplib<1.0.0' 'python-boltons<17.0.0' 'python-boltons>=16.5.0')
makedepends=('python-setuptools')
source=("https://github.com/a-sk/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('575aa9656a9fa89b48eb59f309f8797f')

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
