# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=ggshield
pkgver=1.45.0
pkgrel=1
pkgdesc="Protect your secrets with GitGuardian."
arch=(any)
url="https://github.com/GitGuardian/ggshield"
license=(MIT)
depends=('python' 'git')
makedepends=()
options=('!debug')
# source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
source=("https://github.com/GitGuardian/${pkgname}/releases/download/v${pkgver}/ggshield_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('1744db7f040264c2773d849965438cb7d8a5222ddbe4a11cbf5ab181034582a5')


package() {
  # Install package
  bsdtar -O -xf ggshield_${pkgver}-${pkgrel}_amd64.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
}
