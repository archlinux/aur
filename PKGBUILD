# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=ggshield
pkgver=1.43.0
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
sha256sums=('808f37fcf2aa8a95cf1504434bb963c35893772d60fa37376853752c47a4e335')


package() {
  # Install package
  bsdtar -O -xf ggshield_${pkgver}-${pkgrel}_amd64.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
}
