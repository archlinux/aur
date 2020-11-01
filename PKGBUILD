# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=capa-bin
_pkg=capa
pkgver=1.4.1
pkgrel=1
pkgdesc="The FLARE team's open-source tool to identify capabilities in executable files"
url="https://github.com/fireeye/capa"
arch=('x86_64')
license=('apache')
depends=('python2')
conflicts=('capa')
source=("$url/releases/download/v$pkgver/${_pkg}-v$pkgver-linux.zip")
sha256sums=('89fd3eab3a33f51d4be687707cc45dc0dafa93df6298cf89159896fed3d4db7c')

build() {
  unzip ${_pkg}-v$pkgver-linux.zip
}

package() {
  # create the necessary directory structure
  install -d "${pkgdir}/opt/${_pkg}"
  install -d "${pkgdir}/usr/bin"
 
  # install required scripts
  install -m 755 capa "${pkgdir}/opt/${_pkg}"

  # links scripts to /usr/bin
  ln -s /opt/${_pkg}/capa "${pkgdir}/usr/bin"
}
