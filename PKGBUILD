# Maintainer: wangyifan <wangyifan@acoinfo.com>
# Contributor: chengsiyuan <chengsiyuan@acoinfo.com>

pkgname=sylixos-uploader
pkgver=0.0.5
pkgrel=1
pkgdesc='A command-line tool for uploading SylixOS projects via CORBA.'
arch=(any)
url='https://cdn.git.acosail.cc/go-sylixos/sylixos-uploader.git'
license=(MIT)
provides=("${pkgname}")
source=(git+${url}#tag=v${pkgver})
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  ./build.sh
}

package() {
  cd "${pkgname}"
  install -Dm755 ${pkgname}-linux*-v${pkgver}* "${pkgdir}/usr/bin/${pkgname}"
}

