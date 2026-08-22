# Maintainer: James McMurray <jamesmcm03@gmail.com>
# Contributor: Roey Darwish Dror <roey.ghost@gmail.com>

_pkgname="alma"
pkgname="alma-bin"
pkgver=0.12.0
pkgrel=1
pkgdesc='Create Arch Linux based live USB'
arch=('x86_64')
url='https://github.com/jamesmcm/alma-nv'
license=('GPL3')
makedepends=('git' 'rust' 'libssh2' 'openssl' 'cmake' 'pkg-config' 'zstd')
depends=('gptfdisk' 'parted' 'arch-install-scripts' 'dosfstools' 'coreutils' 'util-linux')
optdepends=('cryptsetup: for root filesystem encryption')
source=("${_pkgname}-nv-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}-nv_${pkgver}_linux_x86-64_gcc")
provides=('alma')
conflicts=('alma')
sha256sums=('a9bb6255353924dd2a5b7fd7e03fdff5f26972d4286cab3631190f8e4785cc7d')

package() {
  install -Dm755 ${_pkgname}-nv-${pkgver} "${pkgdir}/usr/bin/${_pkgname}"
}
