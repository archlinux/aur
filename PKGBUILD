# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=ggshield
pkgver=1.42.0
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
sha256sums=('d4bca0d2d5e45d61fd171cbc7b4767003e39ecebc71e66fc405213e3d9187d3e')


package() {
  # Install package
  bsdtar -O -xf ggshield_${pkgver}-${pkgrel}_amd64.deb data.tar.gz | bsdtar -C "${pkgdir}" -xJf -
}
