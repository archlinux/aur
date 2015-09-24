# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>
# Contributor: Vinícius dos Santos Oliveira <vini [dot] ipsmaker [at] gmail [dot] com>

pkgname=gkeyring-git
pkgver=0.3.r10.g27779a9
pkgrel=1
pkgdesc='A small Python tool for shell access to GNOME keyring. It provides simple querying for and creating of keyring items.'
arch=('any')
url='https://github.com/kparal/gkeyring'
license=('AGPL3')
depends=('python2' 'python2-gnomekeyring' 'python2-distribute')
conflicts=('gkeyring')
options=(!emptydirs)
source=(${pkgname%-git}::git+https://github.com/kparal/gkeyring)
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${pkgname%-git}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
